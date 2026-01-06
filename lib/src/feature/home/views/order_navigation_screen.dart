import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Common
import '../../../common/widget/primary_button.dart';

// Feature Widgets
import '../widget/nav_top_card.dart';
import '../providers/home_provider.dart';
import '../../../models/active_order_model.dart';

class OrderNavigationScreen extends ConsumerWidget {
  const OrderNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(homeProvider).activeOrder;
    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      body: Stack(
        children: [
          // 1. THE MAP (Industry Standard: Use Stack for Map Background)
          Container(
            color: const Color(0xFFEFEFEF),
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Icon(Icons.map_outlined, size: 100, color: Colors.grey),
              // Later, you will replace this Container with:
              // GoogleMap(initialCameraPosition: ...),
            ),
          ),

          // 2. FLOATING TOP OVERLAYS
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const NavTopCard(time: "6 mins", distance: "1.2 km"),
                  const SizedBox(height: 16),
                  // "Navigating to..." Banner
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: brandTeal,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(color: brandTeal.withOpacity(0.3), blurRadius: 10)],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text(
                          "Navigating to FirstStore Partner",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. BOTTOM INFO CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, -5))],
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
                          const Text("FirstStore Partner", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                          Text(order?.pickupLocation ?? "Location details...", style: const TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                      // Circular Call Button
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: brandTeal.withOpacity(0.2)),
                        ),
                        child: const Icon(Icons.call, color: brandTeal, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Instruction Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F9F8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Store Instructions", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(
                          order?.storeInstructions ?? "Follow store safety protocols.",
                          style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Primary Action Button
                  PrimaryButton(
                    text: "I've Reached the Store",
                    onPressed: () {
                      // 1. Update State to Arrived
                      ref.read(homeProvider.notifier).updateActiveOrderStatus(OrderProcessStatus.arrivedAtStore);
                      // 2. Navigate to Pickup Confirmation
                      context.push('/confirm-pickup');
                    },
                  ),
                  const SizedBox(height: 10), // Safe area bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}