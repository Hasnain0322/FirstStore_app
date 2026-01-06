import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/home_provider.dart';
import '../widget/order_lifecycle_widgets.dart';
import '../widget/order_items_card.dart';
import '../../../common/widget//primary_button.dart';
import '../../../models/active_order_model.dart';

class ConfirmPickupScreen extends ConsumerWidget {
  const ConfirmPickupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(homeProvider).activeOrder;
    if (order == null) return const Scaffold();

    bool isReady = order.status == OrderProcessStatus.arrivedAtStore; // Toggle logic based on status

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(title: const Text("Confirm Pickup"), backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          LifecycleStatusCard(
            icon: Icons.inventory_2_outlined,
            title: "You've reached",
            subtitle: order.pickupLocation,
            color: const Color(0xFF00C1AA),
          ),
          const SizedBox(height: 20),
          StoreInfoCard(storeName: "FirstStore Partner - Sector V", orderId: "#${order.orderId}"),
          const SizedBox(height: 20),
          OrderItemsCard(items: order.items, totalValue: order.totalOrderValue),
          const SizedBox(height: 20),

          // Conditional Instruction / Status Box
          isReady ? _buildPickupInstructions() : _buildPackageReadyBox(),

          const SizedBox(height: 30),
          PrimaryButton(
            text: isReady ? "Request Pickup Confirmation" : "Continue to Delivery",
            onPressed: () {
              if (isReady) {
                ref.read(homeProvider.notifier).updateActiveOrderStatus(OrderProcessStatus.pickedUp);
              } else {
                context.push('/active-delivery');
              }
            },
          ),
        ]),
      ),
    );
  }

  Widget _buildPickupInstructions() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: const Color(0xFFE8F0FE), borderRadius: BorderRadius.circular(12)),
    child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Pickup Instructions", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("• Request store staff for the order\n• Verify all items are included\n• Check package is sealed properly", style: TextStyle(fontSize: 12, height: 1.6)),
    ]),
  );

  Widget _buildPackageReadyBox() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: const Color(0xFFE7F9F2), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green.shade200)),
    child: const Row(children: [
      Icon(Icons.check_circle, color: Colors.green, size: 20),
      SizedBox(width: 12),
      Expanded(child: Text("Package Ready\nStore has confirmed handover. Proceed to delivery.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
    ]),
  );
}