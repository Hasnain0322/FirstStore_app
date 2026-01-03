import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/views/custom_text_field.dart';
import '../../../common/views/primary_button.dart';
import '../widget/profile_info_banner.dart';

class UpdateBankScreen extends StatelessWidget {
  const UpdateBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Update Bank Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const ProfileInfoBanner(message: "Secure Information\nYour bank details are encrypted and stored securely.", color: Color(0xFF00C1AA), icon: Icons.shield_outlined),
          const SizedBox(height: 24),
          const CustomTextField(label: "Account Holder Name *", hintText: "Lokesh Kumar"),
          const SizedBox(height: 16),
          const CustomTextField(label: "Bank Name *", hintText: "HDFC Bank"),
          const SizedBox(height: 16),
          const CustomTextField(label: "Account Number *", hintText: "Enter account number"),
          const SizedBox(height: 16),
          const CustomTextField(label: "Confirm Account Number *", hintText: "Re-enter account number"),
          const SizedBox(height: 16),
          const CustomTextField(label: "IFSC Code *", hintText: "HDFC0001234"),
          const SizedBox(height: 24),
          const ProfileInfoBanner(message: "⚠️ Important: Ensure all details match your bank records. Incorrect details may delay payouts.", color: Colors.orange),
          const SizedBox(height: 40),
          PrimaryButton(text: "Save Bank Details", onPressed: () => context.pop()),
        ]),
      ),
    );
  }
}