import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- MODELS & POPUPS ---
import '../../../models/order_request_model.dart';
import '../widget/order_request_popup.dart';

// --- MODULAR WIDGETS ---
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
import '../../profile/views/profile_main_screen.dart'; // 1. IMPORTED PROFILE

// --- PROVIDERS ---
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state for tab switching and online status
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);

    // Industry Standard: Force dark status bar icons for light background
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: IndexedStack(
          index: state.currentIndex,
          children: [
            // Index 0: Home Dashboard
            _HomeDashboardAssembly(state: state, notifier: notifier),

            // Index 1: Earnings
            const EarningsScreen(),

            // Index 2: History
            const HistoryScreen(),

            // Index 3: Support
            const SupportScreen(),

            // Index 4: Profile Dashboard (NOW LINKED)
            const ProfileMainScreen(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(state, notifier),
    );
  }

  // --- REUSABLE BOTTOM NAVIGATION ---
  Widget _buildBottomNav(HomeState state, HomeNotifier notifier) {
    return BottomNavigationBar(
      currentIndex: state.currentIndex,
      onTap: notifier.setIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00C1AA), // Brand Teal
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
class _HomeDashboardAssembly extends StatelessWidget {
  final HomeState state;
  final HomeNotifier notifier;

  const _HomeDashboardAssembly({
    required this.state,
    required this.notifier
  });

  // Function to show the centered "New Order" Popup
  void _showNewOrderPopup(BuildContext context) {
    final mockRequest = OrderRequestModel(
      id: "FS1234",
      pickupLocation: "Park Street, Kolkata",
      dropLocation: "Salt Lake, Sector V",
      pickupDistance: 0.6,
      dropDistance: 2.4,
      estimatedEarnings: 45.0,
      estimatedTime: "10-25 mins",
    );

    showDialog(
      context: context,
      barrierDismissible: false, // Must click Decline or Accept
      builder: (context) => OrderRequestPopup(
        request: mockRequest,
        onAccept: () => Navigator.pop(context),
        onDecline: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Future: API Refresh logic
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

            // 2. DYNAMIC GREETING (Null-Safe)
            Text(
                "Hi, ${state.riderName ?? 'Partner'} 👋",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            const Text(
                "Ready to deliver today?",
                style: TextStyle(color: Colors.grey)
            ),
            const SizedBox(height: 20),

            // 3. STATUS TOGGLE (Modular)
            HomeStatusToggle(
                isOnline: state.isOnline,
                onToggle: notifier.toggleOnline
            ),
            const SizedBox(height: 20),

            // 4. STATS GRID (Dynamic values from state)
            HomeStatsGrid(
              earnings: state.todayEarnings,
              orders: state.totalOrders,
              rating: state.rating,
              isWeekly: false, // This is the Daily Home View
            ),
            const SizedBox(height: 20),

            // 5. CLICKABLE CENTER VIEW (For testing the popup)
            GestureDetector(
              onTap: () {
                if (state.isOnline) _showNewOrderPopup(context);
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