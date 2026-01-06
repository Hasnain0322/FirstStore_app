import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widget//primary_button.dart';
import '../widget/auth_header.dart';
import '../../../common/widget/custom_text_field.dart';
import '../provider/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final profileNotifier = ref.read(profileProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      // Ensure the screen stays clean when keyboard is up
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      // 1. ADD SingleChildScrollView HERE
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(),
              const SizedBox(height: 32),
              const Text(
                'Complete Your Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Enter your personal details',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),

              CustomTextField(
                label: 'Full Name',
                hintText: 'Enter your full name',
                onChanged: profileNotifier.updateName,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: 'Email Address',
                hintText: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
                onChanged: profileNotifier.updateEmail,
              ),

              // 2. REPLACE Spacer() with a fixed SizedBox
              // Spacer causes errors inside scrollable views
              const SizedBox(height: 370),

              PrimaryButton(
                text: 'Continue',
                onPressed: profileState.isFormValid
                    ? () => context.push('/kyc')
                    : null,
              ),

              // 3. Add extra space at bottom so keyboard doesn't hide the button
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}