import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeOfflineView extends StatelessWidget {
  const HomeOfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Custom Icon with Dashed Border
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
              ),
              CustomPaint(
                size: const Size(70, 70),
                painter: DashedCirclePainter(color: Colors.grey.shade400),
              ),
              Icon(Icons.delivery_dining_outlined, size: 36, color: Colors.grey.shade500),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "You're Offline",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 8),
          const Text(
            "Go online to start receiving delivery requests",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// Painter for that specific dotted/dashed ring in your Figma
class DashedCirclePainter extends CustomPainter {
  final Color color;
  DashedCirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3, dashSpace = 4, startBerthing = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final radius = size.width / 2;
    final circumference = 2 * math.pi * radius;
    final dashCount = (circumference / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startBerthing,
        (dashWidth / circumference) * 2 * math.pi,
        false,
        paint,
      );
      startBerthing += ((dashWidth + dashSpace) / circumference) * 2 * math.pi;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}