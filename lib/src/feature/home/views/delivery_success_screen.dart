import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/home_provider.dart';
import '../../../common/widget//primary_button.dart';

class DeliverySuccessScreen extends ConsumerWidget {
  const DeliverySuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CircleAvatar(radius: 40, backgroundColor: Color(0xFFE7F9F2), child: Icon(Icons.celebration, color: Color(0xFF00C1AA), size: 40)),
            const SizedBox(height: 24),
            const Text("Delivery Completed!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Great job! Order #FS12458 was successful.", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            _summaryCard("You Earned", "₹45"),
            const SizedBox(height: 40),
            PrimaryButton(text: "Back to Home", onPressed: () {
              ref.read(homeProvider.notifier).completeOrder(); // Resets state
              context.go('/home');
            }),
          ]),
        ),
      ),
    );
  }

  Widget _summaryCard(String l, String v) => Container(
    padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(20)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l), Text(v, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF00C1AA)))]),
  );
}