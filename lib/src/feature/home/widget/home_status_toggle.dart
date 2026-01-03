import 'package:flutter/material.dart';

class HomeStatusToggle extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onToggle;

  const HomeStatusToggle({
    super.key,
    required this.isOnline,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isOnline ? "Online" : "Offline",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Switch(
                value: isOnline,
                onChanged: onToggle,
                activeColor: const Color(0xFF00C1AA),
              ),
            ],
          ),
          if (isOnline) ...[
            const Divider(),
            const Row(
              children: [
                Icon(Icons.check_circle, color: Color(0xFF00C1AA), size: 16),
                SizedBox(width: 8),
                Text("You're online and ready to receive orders",
                    style: TextStyle(color: Color(0xFF00C1AA), fontSize: 12)),
              ],
            )
          ]
        ],
      ),
    );
  }
}