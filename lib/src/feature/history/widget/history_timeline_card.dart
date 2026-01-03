import 'package:flutter/material.dart';
import '../../../models/order_model.dart';

class HistoryTimelineCard extends StatelessWidget {
  final OrderModel order;
  const HistoryTimelineCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    String finalLabel = order.status == OrderStatus.delivered ? "Delivered" : "Returned to Store";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _row("Picked Up", order.pickupTime),
          const Divider(height: 32, color: Color(0xFFEEEEEE)),
          _row(finalLabel, order.finalTime),
        ],
      ),
    );
  }

  Widget _row(String label, String time) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
      Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}