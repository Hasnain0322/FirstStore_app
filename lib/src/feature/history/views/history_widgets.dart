import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    Color bgColor;
    switch (status.toLowerCase()) {
      case 'delivered':
        color = const Color(0xFF00C1AA);
        bgColor = const Color(0xFFE0F7F5);
        break;
      case 'cancelled':
        color = Colors.red;
        bgColor = const Color(0xFFFFEBEE);
        break;
      case 'returned':
        color = Colors.orange;
        bgColor = const Color(0xFFFFF3E0);
        break;
      default:
        color = Colors.grey;
        bgColor = Colors.grey.shade100;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4)),
      child: Text(status, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

class JourneyLine extends StatelessWidget {
  final String pickup;
  final String drop;
  final bool isCancelled;

  const JourneyLine({super.key, required this.pickup, required this.drop, this.isCancelled = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.store_outlined, color: Color(0xFF00C1AA), size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(pickup, style: const TextStyle(fontWeight: FontWeight.w600))),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Container(
                width: 2, height: 30,
                color: isCancelled ? Colors.grey.withOpacity(0.3) : const Color(0xFF00C1AA),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, color: Color(0xFF00C1AA), size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(drop, style: const TextStyle(fontWeight: FontWeight.w600))),
          ],
        ),
      ],
    );
  }
}