import 'package:flutter/material.dart';

class PayoutInfoCard extends StatelessWidget {
  final String nextPayoutDate;

  const PayoutInfoCard({super.key, required this.nextPayoutDate});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: brandTeal),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF0F9F8),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: brandTeal),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Next payout: $nextPayoutDate\nYour current week's earnings will be transferred to your bank account",
              style: const TextStyle(fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}