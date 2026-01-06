import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/active_order_model.dart';
import '../providers/home_provider.dart';
import '../widget/order_items_card.dart';
import '../../history/widget/journey_line.dart'; // Reusing your existing widget
import '../../history/widget/history_earnings_card.dart'; // Reusing your existing widget
import '../../../common/widget//primary_button.dart';

class ActiveOrderDetailsScreen extends ConsumerWidget {
  const ActiveOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(homeProvider).activeOrder;
    if (order == null) return const Scaffold(body: Center(child: Text("No active order")));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text("Order Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white, elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(20)),
            child: Center(child: Text("Order #${order.orderId}", style: const TextStyle(color: Color(0xFF00C1AA), fontSize: 12, fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. Delivery Journey Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Delivery Journey", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 16),
                  JourneyLine(pickup: "FirstStore Partner\n${order.pickupLocation}", drop: "${order.dropLocation}"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. Items List
            OrderItemsCard(items: order.items, totalValue: order.totalOrderValue),
            const SizedBox(height: 20),

            // 3. Earnings Card (Reused)
            HistoryEarningsCard(amount: "₹${order.earnings.toStringAsFixed(0)}"),

            const SizedBox(height: 40),

            PrimaryButton(
              text: "Start Navigation",
              onPressed: () {
                ref.read(homeProvider.notifier).updateOrderStatus(OrderProcessStatus.navigatingToStore);
                context.push('/order-navigation');
              },
            ),
          ],
        ),
      ),
    );
  }
}