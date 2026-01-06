import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// --- COMMON WIDGETS ---
import 'package:practic_application/src/common/widget/primary_button.dart';

// --- LOCAL AUTH WIDGETS ---
import '../widget/auth_header.dart';
import '../widget/auth_back_button.dart';
import '../widget/kyc_upload_tile.dart';

// --- RESOURCES & PROVIDER ---
import 'package:practic_application/src/res/assets.dart';
import '../provider/kyc_provider.dart';

class KycScreen extends ConsumerWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set Status Bar to Dark Icons for the light background
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    final kycState = ref.watch(kycProvider);
    final kycNotifier = ref.read(kycProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Subtle grey background from Figma
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
                  'Complete Your KYC',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: Color(0xFF161616),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Upload your documents to verify your identity',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const SizedBox(height: 24),

                // --- INSTRUCTIONAL BANNER ---
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppAssets.kycBanner,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),

                // --- UPLOAD TILES ---
                KycUploadTile(
                  title: 'Driving License',
                  subtitle: 'Upload front & back',
                  isUploaded: kycState.isLicenseUploaded,
                  onTap: kycNotifier.uploadLicense,
                ),
                KycUploadTile(
                  title: 'Aadhaar Card',
                  subtitle: 'Upload front & back',
                  isUploaded: kycState.isAadhaarUploaded,
                  onTap: kycNotifier.uploadAadhaar,
                ),
                KycUploadTile(
                  title: 'Selfie',
                  subtitle: 'Take a clear selfie',
                  isUploaded: kycState.isSelfieUploaded,
                  onTap: kycNotifier.uploadSelfie,
                ),

                const SizedBox(height: 35),

                // --- ACTION BUTTON ---
                PrimaryButton(
                  text: "Continue",
                  // Button only activates if all docs are uploaded
                  onPressed: kycState.isKycComplete
                      ? () => context.push('/delivery-setup')
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