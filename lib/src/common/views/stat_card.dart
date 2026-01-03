import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon; // Now optional
  final Color? iconColor; // Now optional

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16), // Increased padding for accuracy
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9), // Matches Figma background
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Only show icon if it is provided (Daily style)
            if (icon != null) ...[
              CircleAvatar(
                radius: 18,
                backgroundColor: iconColor!.withOpacity(0.1),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(height: 8),
            ],

            // Label on Top (Grey)
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 4),
            // Value on Bottom (Bold Black)
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Larger font as per image
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}