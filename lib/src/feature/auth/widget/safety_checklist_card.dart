import 'package:flutter/material.dart';

class SafetyChecklistCard extends StatelessWidget {
  final bool wearHelmet;
  final bool followSpeed;
  final bool thermalBag;
  final Function(String, bool) onChanged;

  const SafetyChecklistCard({
    super.key,
    required this.wearHelmet,
    required this.followSpeed,
    required this.thermalBag,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F9F8), // Light Teal background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Safety & Training Checklist",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)),
          ),
          const SizedBox(height: 16),
          _buildCheckItem("Wear Helmet", wearHelmet, "helmet"),
          _buildCheckItem("Follow Speed Limits", followSpeed, "speed"),
          _buildCheckItem("Keep thermal bag ready", thermalBag, "bag"),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String title, bool value, String key) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            height: 24, width: 24,
            child: Checkbox(
              value: value,
              onChanged: (val) => onChanged(key, val ?? false),
              activeColor: const Color(0xFF00C1AA),
              side: BorderSide(color: Colors.grey.shade300, width: 1.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 14, color: Color(0xFF6A6A6A))),
        ],
      ),
    );
  }
}