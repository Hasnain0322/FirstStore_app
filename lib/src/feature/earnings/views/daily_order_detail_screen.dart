import 'package:flutter/material.dart';

class DailyOrderDetailScreen extends StatelessWidget {
  const DailyOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black),
        title: const Text("Wed, 26 Nov", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildTotalCard(),
          const SizedBox(height: 24),
          const Text("Order Breakdown", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          _buildOrderFareCard("#FS1029", "₹124", ["Base Fare"]),
          _buildOrderFareCard("#FS1030", "₹180", ["Base Fare", "Peak Hour Bonus"]),
          _buildOrderFareCard("#FS1031", "₹150", ["Base Fare"]),
        ],
      ),
    );
  }

  Widget _buildTotalCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total", style: TextStyle(color: Colors.grey)),
          Text("₹ 1,240", style: TextStyle(color: Color(0xFF00C1AA), fontSize: 32, fontWeight: FontWeight.bold)),
          Text("8 orders | 5h 20m online", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildOrderFareCard(String id, String price, List<String> tags) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade100), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order $id", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 4),
          const Text("3:45 PM | Base Fare + Distance", style: TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: tags.map((tag) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(4)),
              child: Text(tag, style: const TextStyle(color: Color(0xFF00C1AA), fontSize: 10, fontWeight: FontWeight.bold)),
            )).toList(),
          )
        ],
      ),
    );
  }
}