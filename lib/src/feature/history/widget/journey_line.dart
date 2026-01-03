import 'package:flutter/material.dart';

class JourneyLine extends StatelessWidget {
  final String pickup;
  final String drop;
  final bool isGreyed;

  const JourneyLine({super.key, required this.pickup, required this.drop, this.isGreyed = false});

  @override
  Widget build(BuildContext context) {
    final Color themeColor = isGreyed ? Colors.grey : const Color(0xFF00C1AA);
    return Column(
      children: [
        _point(Icons.store_outlined, pickup, themeColor),
        _line(themeColor),
        _point(Icons.location_on_outlined, drop, themeColor),
      ],
    );
  }

  Widget _point(IconData icon, String text, Color color) => Row(
    children: [
      Icon(icon, color: color, size: 20),
      const SizedBox(width: 12),
      Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
    ],
  );

  Widget _line(Color color) => Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 9),
    child: Container(width: 2, height: 25, color: color.withOpacity(0.3)),
  );
}