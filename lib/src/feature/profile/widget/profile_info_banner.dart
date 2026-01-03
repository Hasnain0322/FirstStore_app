import 'package:flutter/material.dart';

class ProfileInfoBanner extends StatelessWidget {
  final String message;
  final Color color;
  final IconData? icon;

  const ProfileInfoBanner({super.key, required this.message, required this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.2))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) Icon(icon, size: 18, color: color),
          if (icon != null) const SizedBox(width: 12),
          Expanded(child: Text(message, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600, height: 1.4))),
        ],
      ),
    );
  }
}