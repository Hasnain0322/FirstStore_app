import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Common UI
import '../../../common/widget//primary_button.dart';
import '../../../common/widget//custom_text_field.dart';
// Modular Support Widgets
import '../widget/support_info_banner.dart';
import '../widget/support_quick_chips.dart';
import '../widget/support_segmented_toggle.dart';
import '../widget/support_upload_box.dart';
// State
import '../provider/support_provider.dart';

class IssueFormScreen extends ConsumerWidget {
  final String category;
  const IssueFormScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(supportProvider);
    final notifier = ref.read(supportProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(category, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Dynamic Info Banner (Modular)
            SupportInfoBanner(
              message: category == "Payment Issue"
                  ? "Enter Txn ID or attach a screenshot of your bank/UPI statement."
                  : "Report issues related to order pickup, delivery, or item problems.",
            ),
            const SizedBox(height: 24),

            const Text("Quick Select Issue", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // 2. Quick Select Chips (Modular)
            SupportQuickChips(category: category, state: state, notifier: notifier),
            const SizedBox(height: 24),

            // 3. Category-Specific Fields
            if (category == "Payment Issue") ...[
              const CustomTextField(label: "Order ID (Optional)", hintText: "e.g., FS1234"),
              const SizedBox(height: 16),
              const CustomTextField(label: "Amount *", hintText: "₹ 0.00", keyboardType: TextInputType.number),
              const SizedBox(height: 16),
            ],

            if (category == "App Problem") ...[
              const CustomTextField(label: "Steps to Reproduce *", hintText: "Describe what happened..."),
              const SizedBox(height: 16),
              SupportSegmentedToggle(
                label: "Frequency *",
                options: const ["Always", "Sometimes", "Once"],
                selectedValue: state.selectedFrequency,
                onChanged: notifier.setFrequency,
              ),
              const SizedBox(height: 16),
            ],

            const CustomTextField(label: "Description *", hintText: "Please provide detailed information..."),
            const SizedBox(height: 24),

            // 4. Upload Box (Modular)
            SupportUploadBox(
              title: category == "Payment Issue" ? "Upload transaction screenshot" : "Upload photo of issue",
            ),
            const SizedBox(height: 24),

            // 5. Priority Toggle (Modular & Reusable)
            SupportSegmentedToggle(
              label: "Priority",
              options: const ["Low", "Medium", "High"],
              selectedValue: state.selectedPriority,
              onChanged: notifier.setPriority,
            ),
            const SizedBox(height: 24),

            // 6. Response Time Indicator
            _buildResponseTimeIndicator(state.selectedPriority),

            const SizedBox(height: 40),

            // 7. Submit Button (Reused Common Widget)
            PrimaryButton(text: "Submit Ticket", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildResponseTimeIndicator(String priority) {
    String time = priority == "High" ? "4-8 hours" : priority == "Medium" ? "24-48 hours" : "48-72 hours";
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(12)),
      child: Text(
        "Based on $priority priority, our support team will respond within $time.",
        style: const TextStyle(color: Color(0xFF00C1AA), fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}