import 'package:flutter/material.dart';

class SupportRecentTicketTile extends StatelessWidget {
  final String id;
  final String status;
  final String type;

  const SupportRecentTicketTile({
    super.key,
    required this.id,
    required this.status,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final bool isResolved = status.toLowerCase() == 'resolved';
    final Color statusColor = isResolved ? Colors.green : Colors.blue;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            isResolved ? Icons.check_circle_outline : Icons.access_time,
            color: statusColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${id}_$type",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  "$status | ${isResolved ? 'Yesterday' : '2h ago'}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}