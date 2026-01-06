import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 1. MUST ADD THIS IMPORT
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widget/primary_button.dart';
import '../widget/auth_header.dart';
import '../widget/kyc_upload_tile.dart';
import '../../../res/assets.dart';
import '../provider/kyc_provider.dart';

class KycScreen extends ConsumerWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. SET STATUS BAR TO DARK ICONS
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Keeps it transparent
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light, // Black icons for iOS
    ));

    final kycState = ref.watch(kycProvider);
    final kycNotifier = ref.read(kycProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      // 3. REMOVED AppBar completely to match Figma "Upper Section" perfectly
      // OR if you want to keep the back button, use this specialized AppBar:
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70, // Added height for better spacing
        leadingWidth: 70,  // Give back button more room
        systemOverlayStyle: SystemUiOverlayStyle.dark, // Extra safety for icons
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const BackButton(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Removed SizedBox(height) because the AppBar height now handles it
            const AuthHeader(),
            const SizedBox(height: 32),
            const Text('Complete Your KYC', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Upload your documents to verify your identity', style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 24),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppAssets.kycBanner,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 32),

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

            const SizedBox(height: 32),

            PrimaryButton(
              text: 'Continue',
              onPressed: kycState.isKycComplete
                  ? () => context.push('/delivery-setup')
                  : null,
            ),
            const SizedBox(height: 20), // Bottom padding for scrolling
          ],
        ),
      ),
    );
  }
}