import 'package:flutter/material.dart';

class NavTopCard extends StatelessWidget {
  final String time;
  final String distance;

  const NavTopCard({super.key, required this.time, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _buildInfo("Arriving in", time),
            VerticalDivider(color: Colors.grey.shade200, thickness: 1.5, indent: 5, endIndent: 5),
            _buildInfo("Distance", distance),
            const Spacer(),
            // Circular Navigation Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF00C1AA),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.near_me, color: Colors.white, size: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        ],
      ),
    );
  }
}
