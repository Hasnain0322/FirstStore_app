import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practic_application/src/feature/earnings/provider/payout_provider.dart';
import 'package:practic_application/src/feature/earnings/widget/payout_info_card.dart';
import 'package:practic_application/src/feature/earnings/widget/payout_list_item.dart';

class PayoutHistoryScreen extends ConsumerWidget {
  const PayoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetching the list from the Provider (Dynamic Ready)
    final pastPayouts = ref.watch(payoutHistoryProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Payout History",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        // Using the industry-standard circular back button
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const BackButton(color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. Remove 'const' if it shows red
          PayoutInfoCard(nextPayoutDate: "Fri, 28 Nov"),

          const SizedBox(height: 24),
          const Text(
            "Past Payouts",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),

          // 2. Generating the list dynamically from Provider
          ...pastPayouts.map((data) => PayoutListItem(payout: data)).toList(),
        ],
      ),
    );
  }
}