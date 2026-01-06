import 'package:flutter/material.dart';
import '../../../common/widget//primary_button.dart'; // REUSING YOUR BUTTON

class DeliveryProofScreen extends StatelessWidget {
  const DeliveryProofScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Delivery Proof", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Image Placeholder (The gray box in your Figma)
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.image_outlined, size: 60, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Capture Info Box
            _buildCaptureInfo(),

            const SizedBox(height: 20),

            // Order Detail Summary
            _buildOrderSummary(),

            const Spacer(),

            // Reusing your PrimaryButton with a Download Icon
            PrimaryButton(
              text: "Download Proof",
              onPressed: () {
                // Logic to download image
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaptureInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTimelineItem(Icons.access_time, "Captured at", "3:42 PM • 25 Nov", true),
          const SizedBox(height: 12),
          _buildTimelineItem(Icons.location_on_outlined, "Location", "New Town Action Area", false),
          const Padding(
            padding: EdgeInsets.only(left: 32),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("GPS Location Shared", style: TextStyle(color: Color(0xFF00C1AA), fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimelineItem(IconData icon, String label, String value, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF00C1AA)),
            if (showLine) Container(width: 1, height: 20, color: Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Details", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Order ID", style: TextStyle(color: Colors.grey)), Text("#FS1029")]),
          Divider(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Customer", style: TextStyle(color: Colors.grey)), Text("Rahul Sharma")]),
          Divider(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Delivered", style: TextStyle(color: Colors.grey)), Text("3:42 PM • 25 Nov")]),
        ],
      ),
    );
  }
}