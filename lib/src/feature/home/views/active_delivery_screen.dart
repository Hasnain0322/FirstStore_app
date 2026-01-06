import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/order_lifecycle_widgets.dart';
import '../../../common/widget//primary_button.dart';

class ActiveDeliveryScreen extends StatelessWidget {
  const ActiveDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(title: const Text("Active Delivery"), backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: LifecycleStatusCard(icon: Icons.check, title: "Order Picked", subtitle: "Order #FS12458", color: brandTeal),
          ),
          _buildDeliverySection(brandTeal),
          _buildMapSection(brandTeal, context),
        ]),
      ),
    );
  }

  Widget _buildDeliverySection(Color teal) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Deliver to", style: TextStyle(fontWeight: FontWeight.bold)),
      ListTile(contentPadding: EdgeInsets.zero, title: const Text("Rahul Sharma"), subtitle: const Text("Customer"), trailing: CircleAvatar(backgroundColor: teal.withOpacity(0.1), child: Icon(Icons.call, color: teal))),
      const Text("New Town Action Area, Kolkata\n2.4 km from pickup", style: TextStyle(color: Colors.grey, fontSize: 13)),
    ]),
  );

  Widget _buildMapSection(Color teal, BuildContext context) => Container(
    margin: const EdgeInsets.all(20),
    height: 300,
    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
    child: Stack(children: [
      const Center(child: Icon(Icons.map, size: 50, color: Colors.grey)),
      Positioned(bottom: 20, left: 20, right: 20, child: PrimaryButton(text: "Navigate to Customer", onPressed: () => context.push('/confirm-delivery'))),
    ]),
  );
}