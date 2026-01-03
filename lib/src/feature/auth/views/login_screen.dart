import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // 1. Added for navigation
import 'package:practic_application/src/feature/auth/provider/login_provider.dart';
import 'package:practic_application/src/common/views/primary_button.dart'; // 2. Added reusable button
import 'package:practic_application/src/common/views/auth_header.dart';   // 3. Added reusable header

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the state from Riverpod
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const BackButton(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // REUSED COMPONENT: Logo + Brand
            const AuthHeader(),

            const SizedBox(height: 32),
            const Text(
              'Deliver Fast. Earn More.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Join FirstStore as a Delivery Partner and start earning today.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 40),
            const Text('Mobile Number', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // Phone Input Field
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('🇮🇳 +91 ▾', style: TextStyle(fontSize: 16)),
                  ),
                  Container(width: 1, height: 30, color: Colors.grey.shade300),
                  Expanded(
                    child: TextField(
                      onChanged: loginNotifier.updateNumber,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: const InputDecoration(
                        hintText: 'Enter your mobile number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Agreement Checkbox
            Row(
              children: [
                Checkbox(
                  value: loginState.isAgreed,
                  onChanged: loginNotifier.toggleAgreement,
                  activeColor: const Color(0xFF00C1AA),
                ),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'I agree to FirstStore\'s ',
                      children: [
                        TextSpan(
                          text: 'User Agreement',
                          style: TextStyle(color: Color(0xFF00C1AA)),
                        ),
                        TextSpan(text: ' & '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Color(0xFF00C1AA)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // REUSED COMPONENT: Primary Button with Navigation
            PrimaryButton(
              text: 'Next',
              // Logic: only navigates if 10 digits are entered and checkbox is ticked
              onPressed: loginState.isFormValid
                  ? () => context.push('/otp') // Must have the '/'
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}