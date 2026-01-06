import 'package:flutter/material.dart';

class SuccessSummaryGrid extends StatelessWidget {
  final String deliveryTime;
  final String rating;

  const SuccessSummaryGrid({
    super.key,
    required this.deliveryTime,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSummaryBox(
            Icons.access_time,
            Colors.blue,
            "Delivery time",
            deliveryTime
        ),
        const SizedBox(width: 12),
        _buildSummaryBox(
            Icons.star_border,
            Colors.orange,
            "Rating received",
            rating
        ),
      ],
    );
  }

  Widget _buildSummaryBox(IconData icon, Color color, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}