import 'package:flutter/material.dart';
import '../../../models/active_order_model.dart';

class ShadedOrderItemsCard extends StatelessWidget {
  final List<OrderItem> items;
  final double totalValue;

  const ShadedOrderItemsCard({super.key, required this.items, required this.totalValue});

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
          const Text("Order Items", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 16),
          // Shaded list items
          ...List.generate(items.length, (index) {
            final item = items[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                color: index % 2 == 0 ? const Color(0xFFF9F9F9) : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${item.quantity}x ${item.name}", style: const TextStyle(color: Color(0xFF4A4A4A), fontWeight: FontWeight.w500)),
                  Text("₹${item.price.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            );
          }),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Color(0xFFEEEEEE)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Order Value", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
              Text("₹${totalValue.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}