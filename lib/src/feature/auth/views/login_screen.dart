import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// --- COMMON WIDGETS ---
import 'package:practic_application/src/common/widget/primary_button.dart';
import 'package:practic_application/src/common/widget/custom_text_field.dart';

// --- LOCAL AUTH WIDGETS ---
import 'package:practic_application/src/feature/auth/widget/auth_header.dart';
import 'package:practic_application/src/feature/auth/widget/auth_back_button.dart';
import 'package:practic_application/src/feature/auth/widget/country_code_selector.dart';

// --- PROVIDER ---
import 'package:practic_application/src/feature/auth/provider/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the login state
    final state = ref.watch(loginProvider);
    final notifier = ref.read(loginProvider.notifier);

    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Prevents keyboard overflow
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const AuthBackButton(), // Circular Back Button
                const SizedBox(height: 40),
                const AuthHeader(),     // Logo + FirstStore
                const SizedBox(height: 32),

                const Text(
                  'Deliver Fast. Earn More.',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: Color(0xFF161616),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join FirstStore as a Delivery Partner and start earning today.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 48),

                // --- PHONE INPUT SECTION ---
                CustomTextField(
                  label: "Mobile Number",
                  hintText: "Enter your mobile number",
                  keyboardType: TextInputType.phone,
                  maxLength: 10, // Forces industry standard 10 digits
                  prefix: CountryCodeSelector(selectedCode: state.countryCode),
                  onChanged: notifier.updateNumber,
                ),

                const SizedBox(height: 20),

                // --- AGREEMENT SECTION ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24, width: 24,
                      child: Checkbox(
                        value: state.isAgreed,
                        onChanged: notifier.toggleAgreement,
                        activeColor: brandTeal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "I agree to FirstStore's ",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                          children: [
                            TextSpan(
                              text: "User Agreement",
                              style: TextStyle(color: brandTeal, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: " & "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: brandTeal, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 48), // Spacing instead of Spacer for ScrollView

                // --- ACTION BUTTON ---
                PrimaryButton(
                  text: "Next",
                  // Button only activates if number is exactly 10 digits AND checkbox is ticked
                  onPressed: state.isFormValid
                      ? () => context.push('/otp')
                      : null,
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