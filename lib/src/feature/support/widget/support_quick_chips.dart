import 'package:flutter/material.dart';
import '../provider/support_provider.dart';

class SupportQuickChips extends StatelessWidget {
  final String category;
  final SupportState state;
  final SupportNotifier notifier;

  const SupportQuickChips({
    super.key,
    required this.category,
    required this.state,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    // Dynamic options based on category
    final List<String> options = category == "Payment Issue"
        ? ["Amount not credited", "Double deduction", "Incorrect payout", "Refund not received"]
        : ["Item Missing", "Wrong Item", "Item Damaged", "Customer refused", "Store Closed", "Unable to Deliver"];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((opt) {
        final isSelected = state.selectedQuickIssues.contains(opt);
        return GestureDetector(
          onTap: () => notifier.toggleQuickIssue(opt),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? brandTeal.withOpacity(0.1) : Colors.white,
              border: Border.all(
                color: isSelected ? brandTeal : Colors.grey.shade300,
                width: isSelected ? 1.5 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              opt,
              style: TextStyle(
                color: isSelected ? brandTeal : Colors.black87,
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}