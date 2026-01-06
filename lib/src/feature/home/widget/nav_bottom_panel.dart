import 'package:flutter/material.dart';
import '../../../common/widget/primary_button.dart';

class NavBottomPanel extends StatelessWidget {
  final String storeName;
  final String address;
  final String instructions;
  final VoidCallback onReached;

  const NavBottomPanel({
    super.key,
    required this.storeName,
    required this.address,
    required this.instructions,
    required this.onReached,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(storeName, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                  Text(address, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: brandTeal.withOpacity(0.2))),
                child: const Icon(Icons.call, color: brandTeal, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Store Instructions", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                const SizedBox(height: 4),
                Text(instructions, style: const TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "I've Reached the Store",
            onPressed: onReached,
          ),
        ],
      ),
    );
  }
}