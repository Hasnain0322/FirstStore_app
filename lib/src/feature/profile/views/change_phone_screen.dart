import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widget//custom_text_field.dart';
import '../../../common/widget//primary_button.dart';
import '../widget/profile_info_banner.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Change Phone Number", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ProfileInfoBanner(message: "Secure Verification\nWe'll send an OTP to verify your new phone number.", color: Color(0xFF00C1AA), icon: Icons.verified_user),
          const SizedBox(height: 24),
          const CustomTextField(label: "Current Phone Number", hintText: "+91 98765 43210"),
          const SizedBox(height: 20),
          const Text("New Phone Number *", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(children: [
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)), child: const Text("+91")),
            const SizedBox(width: 12),
            const Expanded(child: CustomTextField(label: "", hintText: "9876543210")),
          ]),
          const Spacer(),
          PrimaryButton(text: "Send OTP", onPressed: () => context.push('/change-phone-otp')),
        ]),
      ),
    );
  }
}