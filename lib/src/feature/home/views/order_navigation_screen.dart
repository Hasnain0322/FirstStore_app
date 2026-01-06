import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/home_provider.dart';
import '../../../models/active_order_model.dart';

class OrderNavigationScreen extends ConsumerWidget {
  const OrderNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Color brandTeal = Color(0xFF00C1AA);
    // Watch the active order to get real-time locations if needed later
    final activeOrder = ref.watch(homeProvider).activeOrder;

    return Scaffold(
      body: Stack(
        children: [
          // 1. MOCK MAP BACKGROUND (Industry Placeholder)
          Container(
            color: Colors.grey.shade100,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Icon(Icons.map_outlined, size: 100, color: Colors.grey),
            ),
          ),

          // 2. TOP FLOATING INFO CARD
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                    ),
                    child: Row(
                      children: [
                        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Arriving in", style: TextStyle(color: Colors.grey, fontSize: 12)), Text("6 mins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))])),
                        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Distance", style: TextStyle(color: Colors.grey, fontSize: 12)), Text("1.2 km", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))])),
                        CircleAvatar(backgroundColor: brandTeal, child: IconButton(icon: const Icon(Icons.near_me, color: Colors.white), onPressed: () {})),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: brandTeal, borderRadius: BorderRadius.circular(30)),
                    child: const Text("📍 Navigating to FirstStore Partner", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),

          // 3. BOTTOM INFO CARD & ACTION BUTTON
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                            const Text("FirstStore Partner", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(activeOrder?.pickupLocation ?? "Location loading...", style: const TextStyle(color: Colors.grey))
                          ]
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: brandTeal, size: 30)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Store Instructions", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(activeOrder?.storeInstructions ?? "Follow store protocol.", style: const TextStyle(color: Colors.black54))
                        ]
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- THE FIXED BUTTON ---
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // A. Update logic: Change status to 'Arrived'
                        ref.read(homeProvider.notifier).updateActiveOrderStatus(OrderProcessStatus.arrivedAtStore);

                        // B. Navigation logic: Go to Confirm Pickup Screen
                        context.push('/confirm-pickup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandTeal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text(
                        "I've Reached the Store",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}