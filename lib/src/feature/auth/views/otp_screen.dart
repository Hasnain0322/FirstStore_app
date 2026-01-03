import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../common/views/primary_button.dart';
import '../../../common/views/auth_header.dart';
import '../provider/otp_provider.dart';


class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider for the timer and OTP state
    final otpState = ref.watch(otpProvider);
    final otpNotifier = ref.read(otpProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(),
            const SizedBox(height: 32),
            const Text(
              'Verify Phone Number',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the OTP sent to +91 XXXXXXXX',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // --- OTP INPUT BOXES ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                    (index) => _OtpInputBox(
                  index: index,
                  onChanged: (value) {
                    // Logic to handle OTP input and focus move
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }

                    // We will collect all digits here in a real app
                    // For now, let's just make the UI work
                  },
                ),
              ),
            ),
            // -----------------------

            const SizedBox(height: 40),

            PrimaryButton(
              text: 'Next',
              onPressed: () {
                context.push('/profile'); // Navigate to profile after OTP
              },
            ),

            const SizedBox(height: 24),

            // Resend Timer

              Text(
                otpState.canResend
                    ? "Resend Code Now"
                    : "Resend Code in 00:${otpState.timerValue.toString().padLeft(2, '0')}",
                style: TextStyle(
                  color: otpState.canResend ? const Color(0xFF000000) : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),

          ],
        ),
      ),
    );
  }
}

// Internal Widget for a single OTP Box
class _OtpInputBox extends StatelessWidget {
  final int index;
  final ValueChanged<String> onChanged;

  const _OtpInputBox({required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), // Only 1 digit per box
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00C1AA), width: 2),
          ),
        ),
      ),
    );
  }
}