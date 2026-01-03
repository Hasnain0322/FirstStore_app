import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practic_application/src/feature/earnings/provider/earnings_provider.dart';

class BreakdownScreen extends StatelessWidget {
  const BreakdownScreen({super.key, required EarningsTab type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Earnings Breakdown", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // "This Week" Tag
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFF00C1AA), borderRadius: BorderRadius.circular(8)),
              child: const Text("This Week", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          // Total Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total earnings this week", style: TextStyle(color: Colors.grey, fontSize: 14)),
                SizedBox(height: 8),
                Text("₹ 10,120", style: TextStyle(color: Color(0xFF00C1AA), fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // List of days
          _buildDayRow(context, "Wed, 26 Nov", "8 orders | 5h 20m online", "₹1,240"),
          _buildDayRow(context, "Tue, 25 Nov", "12 orders | 7h 45m online", "₹1,680"),
          _buildDayRow(context, "Mon, 24 Nov", "10 orders | 6h 10m online", "₹1,560"),
          _buildDayRow(context, "Sun, 23 Nov", "6 orders | 4h 30m online", "₹980"),
        ],
      ),
    );
  }

  Widget _buildDayRow(BuildContext context, String date, String sub, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade100), borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: () => context.push('/order-detail'),
        title: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Icon(Icons.chevron_right, color: Colors.black),
          ],
        ),
      ),
    );
  }
}