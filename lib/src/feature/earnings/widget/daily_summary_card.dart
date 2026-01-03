import 'package:flutter/material.dart';

class DailySummaryCard extends StatelessWidget {
  final String totalEarnings;
  final String stats; // e.g., "8 orders | 5h 20m online"

  const DailySummaryCard({
    super.key,
    required this.totalEarnings,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Total", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            totalEarnings,
            style: const TextStyle(
              color: Color(0xFF00C1AA),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(stats, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}