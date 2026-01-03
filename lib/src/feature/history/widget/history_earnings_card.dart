import 'package:flutter/material.dart';

class HistoryEarningsCard extends StatelessWidget {
  final String amount;
  const HistoryEarningsCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F9F8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: brandTeal.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Total Earnings", style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 4),
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
          const CircleAvatar(
            backgroundColor: brandTeal,
            child: Text("₹", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}