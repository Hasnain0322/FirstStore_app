import 'package:flutter/material.dart';
import '../../../models/order_model.dart';

class StatusBadge extends StatelessWidget {
  final OrderStatus status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    Color bgColor;
    switch (status) {
      case OrderStatus.delivered:
        color = const Color(0xFF00C1AA);
        bgColor = const Color(0xFFE0F7F5);
        break;
      case OrderStatus.cancelled:
        color = Colors.red;
        bgColor = const Color(0xFFFFEBEE);
        break;
      case OrderStatus.returned:
        color = Colors.orange;
        bgColor = const Color(0xFFFFF3E0);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4)),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}