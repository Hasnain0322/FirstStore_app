import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// --- MODELS ---
import '../../../models/order_request_model.dart';
import '../../../models/active_order_model.dart';

// --- MODULAR WIDGETS ---
import '../widget/order_request_popup.dart';
import '../widget/home_header.dart';
import '../widget/home_status_toggle.dart';
import '../widget/home_stats_grid.dart';
import '../widget/home_offline_view.dart';
import '../widget/home_online_view.dart';
import '../widget/home_quick_tips.dart';

// --- FEATURE VIEWS ---
import '../../earnings/views/earnings_screen.dart';
import '../../history/views/history_screen.dart';
import '../../support/views/support_screen.dart';
import '../../profile/views/profile_main_screen.dart';

// --- PROVIDERS ---
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);

    // Force dark icons for the status bar on a light background
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: IndexedStack(
          index: state.currentIndex,
          children: [
            // Index 0: Home Dashboard tab
            const _HomeDashboardAssembly(),

            // Index 1: Earnings tab
            const EarningsScreen(),

            // Index 2: History tab
            const HistoryScreen(),

            // Index 3: Support tab
            const SupportScreen(),

            // Index 4: Profile Dashboard tab
            const ProfileMainScreen(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(state, notifier),
    );
  }

  Widget _buildBottomNav(HomeState state, HomeNotifier notifier) {
    return BottomNavigationBar(
      currentIndex: state.currentIndex,
      onTap: notifier.setIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00C1AA),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: "Earnings"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.headset_mic_outlined), label: "Support"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
      ],
    );
  }
}

// --- DASHBOARD TAB ASSEMBLY ---
// Refactored to ConsumerWidget so it can access 'ref' for the Accept Order logic
class _HomeDashboardAssembly extends ConsumerWidget {
  const _HomeDashboardAssembly();

  void _showNewOrderPopup(BuildContext context, WidgetRef ref) {
    // 1. Prepare the Mock Data for the Order the partner is about to accept
    final mockOrder = ActiveOrderModel(
      orderId: "12458",
      pickupLocation: "Salt Lake Sector V",
      dropLocation: "New Town Action Area, Kolkata",
      pickupDistance: 0.6,
      dropDistance: 2.4,
      earnings: 45.0,
      customerName: "Rahul Sharma",
      pickupTime: "3:10 PM",
      finalTime: "3:24 PM",
      date: "25 Nov",
      items: [
        OrderItem(name: "Fresh Milk (1L)", quantity: 2, price: 98),
        OrderItem(name: "Brown Bread", quantity: 1, price: 45),
        OrderItem(name: "Eggs (6 pcs)", quantity: 1, price: 72),
      ],
    );

    // 2. Prepare the UI model for the Popup
    final uiRequest = OrderRequestModel(
      id: mockOrder.orderId,
      pickupLocation: "Park Street, Kolkata",
      dropLocation: mockOrder.dropLocation,
      pickupDistance: mockOrder.pickupDistance,
      dropDistance: mockOrder.dropDistance,
      estimatedEarnings: mockOrder.earnings,
      estimatedTime: "10-25 mins",
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => OrderRequestPopup(
        request: uiRequest,
        onAccept: () {
          // A. Save the order into the State (Riverpod)
          ref.read(homeProvider.notifier).acceptOrder(mockOrder);

          // B. Close the Dialog safely
          Navigator.of(context, rootNavigator: true).pop();

          // C. Navigate to the Order Details screen
          context.push('/active-order');
        },
        onDecline: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);

    return RefreshIndicator(
      onRefresh: () async {
        // Industry standard: Pull to refresh logic
      },
      color: const Color(0xFF00C1AA),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const SizedBox(height: 24),

            // Greeting based on Provider state
            Text(
                "Hi, ${state.riderName ?? 'Partner'} 👋",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            const Text(
                "Ready to deliver today?",
                style: TextStyle(color: Colors.grey)
            ),
            const SizedBox(height: 20),

            // Dynamic Status Toggle
            HomeStatusToggle(
                isOnline: state.isOnline,
                onToggle: notifier.toggleOnline
            ),
            const SizedBox(height: 20),

            // Stats Grid with dynamic numbers
            HomeStatsGrid(
              earnings: state.todayEarnings,
              orders: state.totalOrders,
              rating: state.rating,
              isWeekly: false,
            ),
            const SizedBox(height: 20),

            // Interaction area to test the "New Order" notification
            GestureDetector(
              onTap: () {
                if (state.isOnline) {
                  _showNewOrderPopup(context, ref);
                }
              },
              child: state.isOnline
                  ? const HomeOnlineView(statusMessage: "Looking for orders...")
                  : const HomeOfflineView(),
            ),

            const SizedBox(height: 20),
            const HomeQuickTips(),
          ],
        ),
      ),
    );
  }
}