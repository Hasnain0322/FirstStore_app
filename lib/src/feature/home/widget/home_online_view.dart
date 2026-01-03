import 'package:flutter/material.dart';
import './home_offline_view.dart'; // To reuse the DashedCirclePainter

class HomeOnlineView extends StatelessWidget {
  final String? statusMessage;

  const HomeOnlineView({super.key, this.statusMessage});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    const Color lightTeal = Color(0xFFE0F7F5);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Teal Icon with Teal Dashed Border
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: lightTeal,
                  shape: BoxShape.circle,
                ),
              ),
              CustomPaint(
                size: const Size(70, 70),
                painter: DashedCirclePainter(color: brandTeal),
              ),
              const Icon(Icons.delivery_dining_outlined, size: 36, color: brandTeal),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            statusMessage ?? "Looking for orders...",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 8),
          const Text(
            "You'll be notified when a new order arrives",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}