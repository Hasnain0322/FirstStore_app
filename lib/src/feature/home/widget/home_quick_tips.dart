import 'package:flutter/material.dart';

class HomeQuickTips extends StatelessWidget {
  const HomeQuickTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(12)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, size: 18, color: Colors.orange),
              SizedBox(width: 8),
              Text("Quick Tips", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 12),
          Text("• Keep your phone charged", style: TextStyle(fontSize: 13, height: 1.5)),
          Text("• Check delivery address before pickup", style: TextStyle(fontSize: 13, height: 1.5)),
          Text("• Always be polite with customers", style: TextStyle(fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }
}