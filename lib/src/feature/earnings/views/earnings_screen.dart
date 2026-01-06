import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Modular Widgets
import '../widget/earnings_tab_bar.dart';
import '../widget/earnings_total_card.dart';
import '../widget/earnings_stats_grid.dart';
import '../widget/earnings_insights_card.dart';
import '../widget/performance_heatmap.dart';
import '../widget/achievement_card.dart';
import '../widget/weekly_summary_card.dart';

// Core & Common
import '../provider/earnings_provider.dart';
import '../../../common/widget//primary_button.dart';

class EarningsScreen extends ConsumerWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(earningsProvider);
    final notifier = ref.read(earningsProvider.notifier);
    final data = state.data;

    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Earnings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Switcher
            EarningsTabBar(
              selectedTab: state.selectedTab,
              onTabChanged: notifier.setTab,
            ),
            const SizedBox(height: 24),

            // 1. SUMMARY SECTION
            if (state.selectedTab == EarningsTab.week)
              WeeklySummaryCard(
                  amount: data?.totalEarnings ?? 0,
                  comparisonText: data?.comparisonText ?? "+0% vs last week"
              )
            else
              EarningsTotalCard(
                label: _getLabel(state.selectedTab),
                amount: data?.totalEarnings,
                comparison: data?.comparisonText,
              ),

            const SizedBox(height: 24),

            // 2. CONDITIONAL WEEKLY VIEW (Insights)
            if (state.selectedTab == EarningsTab.week) ...[
              const EarningsInsightsCard(),
              const SizedBox(height: 24),
            ],

            // 3. CONDITIONAL MONTHLY VIEW (Heatmap & Distribution)
            if (state.selectedTab == EarningsTab.month) ...[
              const PerformanceHeatmap(),
              const SizedBox(height: 24),
              const Text("Achievements", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              const Row(
                children: [
                  AchievementCard(emoji: "💯", label: "100+ Deliveries", bgColor: Color(0xFFE7F9F2)),
                  SizedBox(width: 10),
                  AchievementCard(emoji: "🔥", label: "7-Day Streak", bgColor: Color(0xFFFFF9E6)),
                  SizedBox(width: 10),
                  AchievementCard(emoji: "⭐", label: "Top Performer", bgColor: Color(0xFFE8F0FE)),
                ],
              ),
              const SizedBox(height: 24),
              _buildDistributionSection(),
            ],

            // 4. STATS GRID (Used for Today and Week)
            if (state.selectedTab != EarningsTab.month)
              EarningsStatsGrid(
                isWeekly: state.selectedTab == EarningsTab.week,
                onlineTime: data?.onlineTime,
                avgOrder: data?.avgOrderValue,
                peekOrders: data?.peekOrders,
                rating: data?.rating,
                totalOrders: data?.totalOrders,
              ),

            const SizedBox(height: 40),

            // 5. ACTION BUTTONS
            PrimaryButton(
              text: "View Detailed Breakdown",
              onPressed: () {
                if (state.selectedTab == EarningsTab.today) {
                  context.push('/order-detail');
                } else {
                  context.push('/breakdown', extra: state.selectedTab);
                }
              },
            ),

            Center(
              child: TextButton(
                onPressed: () => context.push('/payout-history'),
                child: const Text("View Payment History",
                    style: TextStyle(color: brandTeal, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDistributionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Earning Distribution", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 16),
        _distRow("Base Pay", "₹20,400", 0.8, Colors.blue),
        _distRow("Incentives", "₹5,760", 0.3, Colors.green),
        _distRow("Peak Bonus", "₹2,800", 0.15, Colors.orange),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(12)),
          child: const Column(
            children: [
              Text("You are ₹2,040 away from your best month!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text("Keep going 💪", style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        )
      ],
    );
  }

  Widget _distRow(String label, String val, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(label, style: const TextStyle(fontSize: 13)),
            Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ]),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: progress, color: color, backgroundColor: Colors.grey.shade100, minHeight: 6, borderRadius: BorderRadius.circular(10)),
        ],
      ),
    );
  }

  String _getLabel(EarningsTab tab) {
    if (tab == EarningsTab.today) return "Today's Earnings";
    if (tab == EarningsTab.week) return "Weekly Earnings";
    return "Monthly Earnings";
  }
}