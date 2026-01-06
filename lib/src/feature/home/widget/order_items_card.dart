import 'package:flutter/material.dart';
import '../../../models/active_order_model.dart';

class OrderItemsCard extends StatelessWidget {
  final List<OrderItem> items;
  final double totalValue;

  const OrderItemsCard({super.key, required this.items, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Order Items", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${item.quantity}x ${item.name}", style: const TextStyle(color: Color(0xFF4A4A4A))),
                Text("₹${item.price.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          )),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Order Value", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("₹${totalValue.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}