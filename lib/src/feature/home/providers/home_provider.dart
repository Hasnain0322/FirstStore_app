import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/active_order_model.dart'; // Ensure this model exists

class HomeState {
  final int currentIndex;
  final bool isOnline;

  // Dashboard Data
  final String? riderName;
  final double? todayEarnings;
  final int? totalOrders;
  final double? rating;

  // Active Order Data (New for the Order Lifecycle)
  final ActiveOrderModel? activeOrder;

  HomeState({
    this.currentIndex = 0,
    this.isOnline = false,
    this.riderName,
    this.todayEarnings,
    this.totalOrders,
    this.rating,
    this.activeOrder,
  });

  HomeState copyWith({
    int? currentIndex,
    bool? isOnline,
    String? riderName,
    double? todayEarnings,
    int? totalOrders,
    double? rating,
    ActiveOrderModel? activeOrder,
    bool clearActiveOrder = false, // Helper to set activeOrder back to null
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isOnline: isOnline ?? this.isOnline,
      riderName: riderName ?? this.riderName,
      todayEarnings: todayEarnings ?? this.todayEarnings,
      totalOrders: totalOrders ?? this.totalOrders,
      rating: rating ?? this.rating,
      // If clearActiveOrder is true, we set the order to null, else keep current/new
      activeOrder: clearActiveOrder ? null : (activeOrder ?? this.activeOrder),
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  // Initialize with MOCK DATA
  HomeNotifier()
      : super(HomeState(
    riderName: "Lokesh",
    todayEarnings: 320.0,
    totalOrders: 5,
    rating: 4.8,
    activeOrder: null, // Start with no active order
  ));

  // --- NAVIGATION & UI LOGIC ---
  void setIndex(int index) => state = state.copyWith(currentIndex: index);

  void toggleOnline(bool value) {
    // If there is an active order, we usually don't allow going offline
    // but for now, we just toggle.
    state = state.copyWith(isOnline: value);
  }

  // --- ORDER LIFECYCLE LOGIC ---

  /// When the partner clicks "Accept Order" on the popup
  void acceptOrder(ActiveOrderModel order) {
    state = state.copyWith(activeOrder: order);
  }

  /// When the partner finishes a step (Arrived at Store -> Picked Up -> Delivered)
  void updateActiveOrderStatus(OrderProcessStatus newStatus) {
    if (state.activeOrder != null) {
      final updatedOrder = state.activeOrder!.copyWith(status: newStatus);
      state = state.copyWith(activeOrder: updatedOrder);
    }
  }

  /// When the delivery is fully finished
  void completeOrder() {
    // 1. Calculate new totals (Add current order earnings to today's earnings)
    final newEarnings = (state.todayEarnings ?? 0) + (state.activeOrder?.earnings ?? 0);
    final newOrderCount = (state.totalOrders ?? 0) + 1;

    // 2. Clear the active order and update dashboard stats
    state = state.copyWith(
      todayEarnings: newEarnings,
      totalOrders: newOrderCount,
      clearActiveOrder: true,
    );
  }

  /// If an order is cancelled or declined
  void cancelOrder() {
    state = state.copyWith(clearActiveOrder: true);
  }

  // --- API DATA UPDATES ---
  void updateDashboardData({String? name, double? earnings, int? orders, double? rating}) {
    state = state.copyWith(
      riderName: name,
      todayEarnings: earnings,
      totalOrders: orders,
      rating: rating,
    );
  }

  void updateOrderStatus(OrderProcessStatus navigatingToStore) {}
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});