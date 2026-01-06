import 'package:flutter/material.dart';

class HomeStatusToggle extends StatelessWidget {
  final bool isOnline;
  final Function(bool) onToggle;

  const HomeStatusToggle({super.key, required this.isOnline, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isOnline ? "Online" : "Offline",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Switch(
            value: isOnline,
            onChanged: onToggle,
            activeColor: const Color(0xFF00C1AA),
          ),
        ],
      ),
    );
  }
}