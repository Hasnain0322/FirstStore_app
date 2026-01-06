import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// --- COMMON WIDGETS ---
import 'package:practic_application/src/common/widget/primary_button.dart';
import 'package:practic_application/src/common/widget/custom_text_field.dart';

// --- LOCAL AUTH WIDGETS ---
import '../widget/auth_header.dart';
import '../widget/auth_back_button.dart';

// --- PROVIDER ---
import '../provider/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the profile state for validation
    final state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Ensures the screen scrolls when the keyboard opens
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
                  'Complete Your Profile',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: Color(0xFF161616),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter your personal details',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 48),

                // --- FULL NAME INPUT ---
                CustomTextField(
                  label: "Full Name",
                  hintText: "Enter your full name",
                  keyboardType: TextInputType.name,
                  onChanged: notifier.updateName,
                ),

                const SizedBox(height: 24),

                // --- EMAIL ADDRESS INPUT ---
                CustomTextField(
                  label: "Email Address",
                  hintText: "Enter your email address",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) => notifier.updateEmail(val),
                ),

                const SizedBox(height: 48), // Spacing for ScrollView

                // --- ACTION BUTTON ---
                PrimaryButton(
                  text: "Continue",
                  // Button only activates if name and email are valid
                  onPressed: state.isFormValid
                      ? () => context.push('/kyc')
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