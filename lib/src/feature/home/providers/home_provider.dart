import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final int currentIndex;
  final bool isOnline;

  // Dynamic fields with default "Mock" values
  final String? riderName;
  final double? todayEarnings;
  final int? totalOrders;
  final double? rating;

  HomeState({
    this.currentIndex = 0,
    this.isOnline = false,
    this.riderName,
    this.todayEarnings,
    this.totalOrders,
    this.rating,
  });

  HomeState copyWith({
    int? currentIndex,
    bool? isOnline,
    String? riderName,
    double? todayEarnings,
    int? totalOrders,
    double? rating,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isOnline: isOnline ?? this.isOnline,
      riderName: riderName ?? this.riderName,
      todayEarnings: todayEarnings ?? this.todayEarnings,
      totalOrders: totalOrders ?? this.totalOrders,
      rating: rating ?? this.rating,
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  // Initialize with MOCK DATA for now
  HomeNotifier() : super(HomeState(
    riderName: "Lokesh",
    todayEarnings: 320.0,
    totalOrders: 5,
    rating: 4.8,
  ));

  void setIndex(int index) => state = state.copyWith(currentIndex: index);
  void toggleOnline(bool value) => state = state.copyWith(isOnline: value);

  // Future method for when API is ready
  void updateData(String name, double earnings) {
    state = state.copyWith(riderName: name, todayEarnings: earnings);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier());