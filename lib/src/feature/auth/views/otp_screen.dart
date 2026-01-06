import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// --- COMMON WIDGETS ---
import 'package:practic_application/src/common/widget/primary_button.dart';

// --- LOCAL AUTH WIDGETS ---
import '../widget/auth_header.dart';
import '../widget/auth_back_button.dart';
import '../widget/otp_input_row.dart';

// --- PROVIDER ---
import '../provider/otp_provider.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(otpProvider);
    final notifier = ref.read(otpProvider.notifier);

    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const AuthBackButton(),
                const SizedBox(height: 40),
                const AuthHeader(),
                const SizedBox(height: 32),

                const Text(
                  'Verify Phone Number',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter the OTP sent to +91 XXXXXXXX',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const SizedBox(height: 48),

                // --- OTP BOXES SECTION ---
                OtpInputRow(
                  onOtpChanged: (val) {
                    // Logic to update provider code
                  },
                ),

                const SizedBox(height: 40),

                // --- ACTION BUTTON ---
                PrimaryButton(
                  text: "Next",
                  onPressed: () => context.push('/profile'), // Navigates to Complete Profile
                ),

                const SizedBox(height: 24),

                // --- TIMER SECTION ---
                Text(
                  state.canResend
                      ? "Resend Code Now"
                      : "Resend Code in 00:${state.timerValue.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}