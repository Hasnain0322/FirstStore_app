import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150'), // Use your asset image here
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current Location", style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text("Salt Lake, Kolkata", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          ],
        ),
        const Spacer(),
        // Notification bell in Branded Teal
        const Icon(Icons.notifications_none, color: Color(0xFF00C1AA), size: 28),
      ],
    );
  }
}