import 'package:flutter/material.dart';

class OrderJourneyStepper extends StatelessWidget {
  final String pickupName;
  final String pickupAddress;
  final String pickupDistance;
  final String deliverName;
  final String deliverAddress;
  final String deliverDistance;

  const OrderJourneyStepper({
    super.key,
    required this.pickupName,
    required this.pickupAddress,
    required this.pickupDistance,
    required this.deliverName,
    required this.deliverAddress,
    required this.deliverDistance,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Column(
      children: [
        // Pickup Section
        _buildStep(
          icon: Icons.store_mall_directory_outlined,
          label: "Pickup From",
          name: pickupName,
          address: pickupAddress,
          distance: pickupDistance,
          iconColor: brandTeal,
          showLine: true,
        ),
        // Delivery Section
        _buildStep(
          icon: Icons.person_outline,
          label: "Deliver To",
          name: deliverName,
          address: deliverAddress,
          distance: deliverDistance,
          iconColor: brandTeal,
          showLine: false,
        ),
      ],
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String label,
    required String name,
    required String address,
    required String distance,
    required Color iconColor,
    required bool showLine,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column: Icon and Vertical Line
          Column(
            children: [
              Icon(icon, color: iconColor, size: 24),
              if (showLine)
                Expanded(
                  child: Container(
                    width: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.grey.shade300,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Right Column: Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Text(name, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                Text(address, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                // Distance Badge
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Color(0xFF00C1AA), size: 14),
                    const SizedBox(width: 4),
                    Text(distance, style: const TextStyle(color: Color(0xFF00C1AA), fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
                if (showLine) const SizedBox(height: 24), // Spacing between steps
              ],
            ),
          ),
        ],
      ),
    );
  }
}