import 'package:flutter/material.dart';

class EarningsTotalCard extends StatelessWidget {
  final double? amount;
  final String label;
  final String? comparison;

  const EarningsTotalCard({super.key, this.amount, required this.label, this.comparison});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            "₹ ${(amount ?? 0).toStringAsFixed(0)}",
            style: const TextStyle(color: Color(0xFF00C1AA), fontSize: 32, fontWeight: FontWeight.bold),
          ),
          if (comparison != null)
            Text(comparison!, style: const TextStyle(color: Color(0xFF00C1AA), fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}