import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/home_provider.dart';
import '../widget/order_journey_stepper.dart';
import '../widget/shaded_order_items_card.dart';
import '../widget/order_lifecycle_widgets.dart';
import '../../../common/widget/primary_button.dart';
import '../../../models/active_order_model.dart';

class ActiveOrderDetailsScreen extends ConsumerWidget {
  const ActiveOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(homeProvider).activeOrder;
    if (order == null) return const Scaffold(body: Center(child: Text("Order Expired")));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text("Order Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        actions: [
          // Order ID Chip in the App Bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(20)),
              child: Text("Order #${order.orderId}", style: const TextStyle(color: Color(0xFF00C1AA), fontSize: 11, fontWeight: FontWeight.w900)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. DELIVERY JOURNEY CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Delivery Journey", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                  const SizedBox(height: 20),
                  OrderJourneyStepper(
                    pickupName: "FirstStore Partner",
                    pickupAddress: order.pickupLocation,
                    pickupDistance: "${order.pickupDistance} km away",
                    deliverName: order.customerName,
                    deliverAddress: order.dropLocation,
                    deliverDistance: "${order.dropDistance} km from pickup",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. ITEMS CARD
            ShadedOrderItemsCard(items: order.items, totalValue: order.totalOrderValue),
            const SizedBox(height: 20),

            // 3. EARNINGS BANNER (Picture Perfect match)
            _buildEarningsBanner(order.earnings.toStringAsFixed(0)),

            const SizedBox(height: 40),

            // 4. ACTION BUTTON
            PrimaryButton(
              text: "Start Navigation",
              icon: Icons.arrow_forward,
              onPressed: () {
                ref.read(homeProvider.notifier).updateActiveOrderStatus(OrderProcessStatus.navigatingToStore);
                context.push('/order-navigation');
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsBanner(String amount) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F9F2).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00C1AA).withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Your Earnings", style: TextStyle(color: Colors.grey, fontSize: 13)),
              Text("₹ $amount", style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Color(0xFF32BA7C),
            child: Text("₹", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ],
      ),
    );
  }
}