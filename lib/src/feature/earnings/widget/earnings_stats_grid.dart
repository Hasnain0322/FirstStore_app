import 'package:flutter/material.dart';
import '../../../common/widget//stat_card.dart';

class EarningsStatsGrid extends StatelessWidget {
  final bool isWeekly; // This flag changes the UI style
  final String? onlineTime;
  final double? avgOrder;
  final int? peekOrders;
  final double? rating;
  final int? totalOrders;

  const EarningsStatsGrid({
    super.key,
    required this.isWeekly,
    this.onlineTime,
    this.avgOrder,
    this.peekOrders,
    this.rating,
    this.totalOrders,
  });

  @override
  Widget build(BuildContext context) {
    if (isWeekly) {
      // --- WEEKLY STYLE (Simple Cards, No Icons, Left Aligned) ---
      return Column(
        children: [
          Row(
            children: [
              StatCard(
                label: "Total Orders",
                value: "${totalOrders ?? 0}",
              ),
              const SizedBox(width: 12),
              StatCard(
                label: "Online Time",
                value: onlineTime ?? "0h 0m",
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              StatCard(
                label: "Peek Orders",
                value: "${peekOrders ?? 0}",
              ),
              const SizedBox(width: 12),
              StatCard(
                label: "Avg. Ratings",
                value: "${rating ?? 0.0}",
              ),
            ],
          ),
        ],
      );
    } else {
      // --- DAILY STYLE (With Icons and Circular Backgrounds) ---
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1.4, // Adjusted for Daily icons
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          StatCard(
            label: "Online Time",
            value: onlineTime ?? "0h",
            icon: Icons.access_time,
            iconColor: Colors.blue,
          ),
          StatCard(
            label: "Avg. per Order",
            value: "₹${(avgOrder ?? 0).toStringAsFixed(0)}",
            icon: Icons.payments_outlined,
            iconColor: Colors.teal,
          ),
          StatCard(
            label: "Peek Orders",
            value: "${peekOrders ?? 0}",
            icon: Icons.trending_up,
            iconColor: Colors.orange,
          ),
          StatCard(
            label: "Ratings",
            value: "${rating ?? 0.0}",
            icon: Icons.star_border,
            iconColor: Colors.orange,
          ),
        ],
      );
    }
  }
}