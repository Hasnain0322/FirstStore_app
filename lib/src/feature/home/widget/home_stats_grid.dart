import 'package:flutter/material.dart';
import '../../../common/widget//stat_card.dart';

class HomeStatsGrid extends StatelessWidget {
  final double? earnings; // Nullable
  final int? orders;      // Nullable
  final double? rating;   // Nullable

  const HomeStatsGrid({super.key, this.earnings, this.orders, this.rating, required bool isWeekly});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatCard(
          label: "Today's Earnings",
          // If earnings is null, show 0
          value: "₹${(earnings ?? 0).toStringAsFixed(0)}",
          icon: Icons.trending_up,
          iconColor: Colors.green,
        ),
        const SizedBox(width: 12),
        StatCard(
          label: "Orders",
          value: "${orders ?? 0}",
          icon: Icons.shopping_basket_outlined,
          iconColor: Colors.blue,
        ),
        const SizedBox(width: 12),
        StatCard(
          label: "Rating",
          value: "${rating ?? 0.0}",
          icon: Icons.star_border,
          iconColor: Colors.orange,
        ),
      ],
    );
  }
}