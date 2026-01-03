import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// --- MODELS & PROVIDERS ---
import 'package:practic_application/src/models/order_model.dart';
import 'package:practic_application/src/feature/earnings/provider/earnings_provider.dart';

// --- COMMON & AUTH ---
import 'package:practic_application/src/common/views/splash.dart';
import 'package:practic_application/src/feature/auth/views/login_screen.dart';
import 'package:practic_application/src/feature/auth/views/otp_screen.dart';
import 'package:practic_application/src/feature/auth/views/profile_screen.dart';
import 'package:practic_application/src/feature/auth/views/kyc_screen.dart';
import 'package:practic_application/src/feature/auth/views/delivery_setup_screen.dart';

// --- HOME ---
import 'package:practic_application/src/feature/home/views/home_screen.dart';

// --- EARNINGS ---
import 'package:practic_application/src/feature/earnings/views/breakdown_screen.dart';
import 'package:practic_application/src/feature/earnings/views/payout_history_screen.dart';
import 'package:practic_application/src/feature/earnings/views/daily_order_detail_screen.dart';

// --- SUPPORT ---
import 'package:practic_application/src/feature/support/views/support_screen.dart';
import 'package:practic_application/src/feature/support/views/select_category_screen.dart';
import 'package:practic_application/src/feature/support/views/issue_form_screen.dart';

// --- HISTORY ---
import 'package:practic_application/src/feature/history/views/history_screen.dart';
import 'package:practic_application/src/feature/history/views/history_detail_screen.dart';
import 'package:practic_application/src/feature/history/views/feedback_screen.dart';
import 'package:practic_application/src/feature/history/views/delivery_proof_screen.dart';

// --- PROFILE ---
import 'package:practic_application/src/feature/profile/views/profile_main_screen.dart';
import 'package:practic_application/src/feature/profile/views/edit_profile_screen.dart';
import 'package:practic_application/src/feature/profile/views/change_phone_screen.dart';
import 'package:practic_application/src/feature/profile/views/change_phone_otp_screen.dart';
import 'package:practic_application/src/feature/profile/views/bank_details_screen.dart';
import 'package:practic_application/src/feature/profile/views/update_bank_screen.dart';
import 'package:practic_application/src/feature/profile/views/settings_screen.dart';
import 'package:practic_application/src/feature/profile/views/notification_settings_screen.dart';
import 'package:practic_application/src/feature/profile/views/language_settings_screen.dart';
import 'package:practic_application/src/feature/profile/views/privacy_security_screen.dart';
import 'package:practic_application/src/feature/profile/views/delete_account_screen.dart';
import 'package:practic_application/src/feature/profile/views/about_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // Useful for debugging navigation during development
    routes: [
      // Splash & Auth Flow
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/otp', builder: (context, state) => const OtpScreen()),
      GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
      GoRoute(path: '/kyc', builder: (context, state) => const KycScreen()),
      GoRoute(path: '/delivery-setup', builder: (context, state) => const DeliverySetupScreen()),

      // Main Application Entry
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),

      // Earnings Module
      GoRoute(
          path: '/breakdown',
          builder: (context, state) {
            final tabType = state.extra as EarningsTab;
            return BreakdownScreen(type: tabType);
          }
      ),
      GoRoute(path: '/payout-history', builder: (context, state) => const PayoutHistoryScreen()),
      GoRoute(path: '/order-detail', builder: (context, state) => const DailyOrderDetailScreen()),

      // History Module
      GoRoute(path: '/history', builder: (context, state) => const HistoryScreen()),
      GoRoute(
          path: '/history-detail',
          builder: (context, state) {
            final order = state.extra as OrderModel;
            return HistoryDetailScreen(order: order);
          }
      ),
      GoRoute(path: '/feedback', builder: (context, state) => const FeedbackScreen()),
      GoRoute(path: '/proof', builder: (context, state) => const DeliveryProofScreen()),

      // Support Module
      GoRoute(path: '/support', builder: (context, state) => const SupportScreen()),
      GoRoute(path: '/select-category', builder: (context, state) => const SelectCategoryScreen()),
      GoRoute(
          path: '/issue-form',
          builder: (context, state) {
            final cat = state.extra as String;
            return IssueFormScreen(category: cat);
          }
      ),

      // Profile Module (All 12 Screens)
      GoRoute(path: '/profile-tab', builder: (context, state) => const ProfileMainScreen()),
      GoRoute(path: '/edit-profile', builder: (context, state) => const EditProfileScreen()),
      GoRoute(path: '/change-phone', builder: (context, state) => const ChangePhoneScreen()),
      GoRoute(path: '/change-phone-otp', builder: (context, state) => const ChangePhoneOtpScreen()),
      GoRoute(path: '/bank-details', builder: (context, state) => const BankDetailsScreen()),
      GoRoute(path: '/update-bank', builder: (context, state) => const UpdateBankScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      GoRoute(path: '/notifications', builder: (context, state) => const NotificationSettingsScreen()),
      GoRoute(path: '/language', builder: (context, state) => const LanguageSettingsScreen()),
      GoRoute(path: '/privacy', builder: (context, state) => const PrivacySecurityScreen()),
      GoRoute(path: '/delete-account', builder: (context, state) => const DeleteAccountScreen()),
      GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
    ],
  );
}