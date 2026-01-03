import 'package:flutter/material.dart';
import '../../../models/order_request_model.dart';

class OrderRequestPopup extends StatelessWidget {
  final OrderRequestModel request;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const OrderRequestPopup({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Dialog( // Changed to Dialog for centering
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20), // Padding from screen edges
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24), // Rounded corners all around
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes only necessary space
          children: [
            // 1. "New Delivery Request" Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: brandTeal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("🚀 ", style: TextStyle(fontSize: 14)),
                  Text(
                    "New Delivery Request",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. Header
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "FirstStore",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  request.pickupLocation,
                  style: const TextStyle(fontSize: 18, color: Color(0xFF4A4A4A), fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 3. Stats Grid (Pickup Distance & Earnings)
            Row(
              children: [
                _buildStatBox(
                  label: "Pickup Distance",
                  value: "${request.pickupDistance} km",
                  icon: Icons.near_me_outlined,
                  color: const Color(0xFFE8F0FE),
                  iconColor: Colors.blue,
                ),
                const SizedBox(width: 12),
                _buildStatBox(
                  label: "Earnings",
                  value: "₹${request.estimatedEarnings.toStringAsFixed(0)}",
                  icon: Icons.currency_rupee,
                  color: const Color(0xFFE7F9F2),
                  iconColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 4. Drop Location Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: brandTeal),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Drop Location", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(
                          request.dropLocation,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${request.dropDistance} km",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 5. Estimated Time Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time_filled, color: Colors.orange, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    "Estimated delivery time: ${request.estimatedTime}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 6. Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onDecline,
                    icon: const Icon(Icons.close, color: Colors.red),
                    label: const Text("Decline", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAccept,
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text("Accept Order", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brandTeal,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 7. Auto-reject Timer
            const Text(
              "Auto-reject in 30 seconds",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for the blue and green small boxes
  Widget _buildStatBox({
    required String label,
    required String value,
    required IconData icon,
    required Color color,
    required Color iconColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 10, color: Colors.black54)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}