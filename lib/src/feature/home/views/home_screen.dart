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

    // Industry Standard: Force dark status bar icons for light background (#F9F9F9)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Pixel perfect background color
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

  // --- REUSABLE BOTTOM NAVIGATION ---
  Widget _buildBottomNav(HomeState state, HomeNotifier notifier) {
    const Color brandTeal = Color(0xFF00C1AA);
    return BottomNavigationBar(
      currentIndex: state.currentIndex,
      onTap: notifier.setIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: brandTeal,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      elevation: 10,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), activeIcon: Icon(Icons.account_balance_wallet), label: "Earnings"),
        BottomNavigationBarItem(icon: Icon(Icons.history), activeIcon: Icon(Icons.history_toggle_off), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.headset_mic_outlined), activeIcon: Icon(Icons.headset_mic), label: "Support"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}

// --- DASHBOARD TAB ASSEMBLY ---
class _HomeDashboardAssembly extends ConsumerWidget {
  const _HomeDashboardAssembly();

  void _showNewOrderPopup(BuildContext context, WidgetRef ref) {
    // 1. Mock Data for a real Order Lifecycle
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

    // 2. Map to the Popup UI Model
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
          ref.read(homeProvider.notifier).acceptOrder(mockOrder);
          Navigator.of(context, rootNavigator: true).pop();
          context.push('/active-order');
        },
        onDecline: () => Navigator.of(context, rootNavigator: true).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);

    return RefreshIndicator(
      onRefresh: () async {
        // Handle pull-to-refresh logic here
      },
      color: const Color(0xFF00C1AA),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Profile & Location
            const HomeHeader(),
            const SizedBox(height: 32),

            // Greeting Section (Refined Weights)
            Text(
                "Hi, ${state.riderName ?? 'Partner'} 👋",
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -0.5)
            ),
            const SizedBox(height: 4),
            const Text(
                "Ready to deliver today?",
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)
            ),
            const SizedBox(height: 24),

            // Online/Offline Switch Component
            HomeStatusToggle(
                isOnline: state.isOnline,
                onToggle: notifier.toggleOnline
            ),
            const SizedBox(height: 24),

            // 3-Card Stats Grid (Earnings, Orders, Rating)
            HomeStatsGrid(
              earnings: state.todayEarnings,
              orders: state.totalOrders,
              rating: state.rating,
              isWeekly: false,
            ),
            const SizedBox(height: 24),

            // Center Interaction View (Dashed Box Icon)
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

            const SizedBox(height: 24),

            // Bottom Tips Section
            const HomeQuickTips(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}