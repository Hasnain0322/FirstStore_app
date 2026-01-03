import 'package:flutter/material.dart';

class SupportInfoBanner extends StatelessWidget {
  final String message;

  const SupportInfoBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    const Color lightTeal = Color(0xFFE0F7F5);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightTeal,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: brandTeal.withOpacity(0.1)),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: brandTeal,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
      ),
    );
  }
}