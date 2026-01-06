import 'package:flutter/material.dart';
import '../../../common/widget/stat_card.dart';

class HomeStatsGrid extends StatelessWidget {
  final double? earnings;
  final int? orders;
  final double? rating;
  final bool isWeekly;

  const HomeStatsGrid({
    super.key,
    this.earnings,
    this.orders,
    this.rating,
    this.isWeekly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Earnings (Green Theme)
        StatCard(
          label: "Today's Earnings",
          value: "₹${(earnings ?? 0).toStringAsFixed(0)}",
          icon: Icons.trending_up,
          iconColor: const Color(0xFF32BA7C), // Specific Figma Green
        ),

        const SizedBox(width: 12), // Spacing between cards

        // 2. Orders (Blue Theme)
        StatCard(
          label: "Orders",
          value: "${orders ?? 0}",
          icon: Icons.inventory_2_outlined,
          iconColor: const Color(0xFF4C6FFF), // Specific Figma Blue
        ),

        const SizedBox(width: 12), // Spacing between cards

        // 3. Rating (Yellow Theme)
        StatCard(
          label: "Rating",
          value: "${rating ?? 0.0}",
          icon: Icons.star_border_rounded,
          iconColor: const Color(0xFFFFB017), // Specific Figma Yellow
        ),
      ],
    );
  }
}