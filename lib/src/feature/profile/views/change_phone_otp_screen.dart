import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widget//primary_button.dart';
import '../widget/profile_info_banner.dart';

class ChangePhoneOtpScreen extends StatelessWidget {
  const ChangePhoneOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Change Phone Number"), backgroundColor: Colors.white, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ProfileInfoBanner(message: "Secure Verification\nWe'll send an OTP to verify your new phone number.", color: Color(0xFF00C1AA)),
          const SizedBox(height: 24),
          const Text("Enter the OTP sent to +91 XXXXXXXX"),
          const SizedBox(height: 20),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // REUSE: Use your _OtpInputBox widget logic here
          ]),
          const SizedBox(height: 16),
          const Text("Resend Code in 00:30"),
          const Spacer(),
          PrimaryButton(text: "Verify & Update", onPressed: () => context.go('/profile-tab')),
        ]),
      ),
    );
  }
}