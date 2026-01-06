import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widget//primary_button.dart';

class ConfirmDeliveryScreen extends StatelessWidget {
  const ConfirmDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Confirm Delivery"), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          _buildDetailBox("Package Details", "Customer: Rahul Sharma\nAddress: New Town Action Area"),
          const SizedBox(height: 24),
          const Text("Proof of Delivery", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildDashedUpload(),
          const Spacer(),
          PrimaryButton(text: "Complete Delivery", onPressed: () => context.push('/delivery-success')),
        ]),
      ),
    );
  }

  Widget _buildDetailBox(String t, String c) => Container(
    width: double.infinity, padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text(c, style: const TextStyle(color: Colors.grey))]),
  );

  Widget _buildDashedUpload() => Container(
    height: 200, width: double.infinity,
    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300, style: BorderStyle.none), color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)),
    child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.camera_alt_outlined, size: 40, color: Color(0xFF00C1AA)), Text("Take Photo", style: TextStyle(color: Color(0xFF00C1AA), fontWeight: FontWeight.bold))]),
  );
}