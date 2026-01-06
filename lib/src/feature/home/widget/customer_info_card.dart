import 'package:flutter/material.dart';

class CustomerInfoCard extends StatelessWidget {
  final String customerName;
  final String address;
  final String distance;
  final VoidCallback onCall;

  const CustomerInfoCard({
    super.key,
    required this.customerName,
    required this.address,
    required this.distance,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

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
          const Text("Deliver to", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const Text("Customer", style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ),
              // Circular Call Button
              GestureDetector(
                onTap: onCall,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: brandTeal.withOpacity(0.2)),
                  ),
                  child: const Icon(Icons.call, color: brandTeal, size: 24),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Address Box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address, style: const TextStyle(fontSize: 14, color: Color(0xFF4A4A4A))),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("$distance from pickup", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}