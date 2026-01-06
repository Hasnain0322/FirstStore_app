import 'package:flutter/material.dart';

// 1. TOP CIRCULAR STATUS CARD
class LifecycleStatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const LifecycleStatusCard({super.key, required this.icon, required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        CircleAvatar(radius: 40, backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color, size: 36)),
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ]),
    );
  }
}

// 2. STORE INFO CARD
class StoreInfoCard extends StatelessWidget {
  final String storeName;
  final String orderId;

  const StoreInfoCard({super.key, required this.storeName, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Store Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 16),
        _row("Store Name", storeName),
        const Divider(height: 24),
        _row("Order ID", orderId),
      ]),
    );
  }

  Widget _row(String l, String v) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(l, style: const TextStyle(color: Colors.grey, fontSize: 13)),
    Text(v, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
  ]);
}