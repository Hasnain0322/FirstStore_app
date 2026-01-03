import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/order_model.dart';
import '../widget/status_badge.dart';
import '../widget/journey_line.dart';
import '../widget/history_timeline_card.dart';
import '../widget/history_earnings_card.dart';

class HistoryDetailScreen extends StatelessWidget {
  final OrderModel order;
  const HistoryDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order ${order.id}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white, elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusBadge(status: order.status),
            const SizedBox(height: 24),

            // 1. TIMELINE: Show for Delivered and Returned, hide for Cancelled
            if (order.status != OrderStatus.cancelled) ...[
              const Text("Timeline", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              HistoryTimelineCard(order: order),
              const SizedBox(height: 24),
            ],

            // 2. JOURNEY: Always shown
            const Text("Delivery Journey", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _buildJourneyCard(),

            const SizedBox(height: 24),

            // 3. STATUS SPECIFIC BOTTOM SECTIONS
            if (order.status == OrderStatus.delivered) ...[
              HistoryEarningsCard(amount: order.amount),
              const SizedBox(height: 20),
              _buildActionTile(context, "View Customer Feedback", Icons.star_outline, "/feedback"),
              _buildActionTile(context, "View Delivery Proof", Icons.image_outlined, "/proof"),
            ],

            if (order.status == OrderStatus.cancelled || order.status == OrderStatus.returned)
              _buildReasonCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildJourneyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(16),
      ),
      child: JourneyLine(
        pickup: "FirstStore Partner\n${order.pickupLocation}",
        drop: "${order.customerName}\n${order.dropLocation}",
        // Change line color to orange if returned
        isGreyed: order.status == OrderStatus.cancelled,
      ),
    );
  }

  Widget _buildReasonCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Reason", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(order.reason ?? "Unknown", style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildActionTile(BuildContext context, String title, IconData icon, String route) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () => context.push(route),
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}