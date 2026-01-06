import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// --- COMMON WIDGETS ---
import 'package:practic_application/src/common/widget/primary_button.dart';
import 'package:practic_application/src/common/widget/custom_text_field.dart';

// --- LOCAL AUTH WIDGETS ---
import '../widget/auth_header.dart';
import '../widget/auth_back_button.dart';
import '../widget/vehicle_type_selector.dart';
import '../widget/safety_checklist_card.dart';

// --- PROVIDER ---
import '../provider/delivery_setup_provider.dart';

class DeliverySetupScreen extends ConsumerWidget {
  const DeliverySetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliverySetupProvider);
    final notifier = ref.read(deliverySetupProvider.notifier);

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
                  'Setup Your Delivery Profile',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add your vehicle details and complete training',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const SizedBox(height: 32),

                // --- VEHICLE TYPE ---
                const Text(
                  "Vehicle Type",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 12),
                VehicleTypeSelector(
                  selectedType: state.selectedVehicle,
                  onTypeSelected: notifier.setVehicle,
                ),

                const SizedBox(height: 24),

                // --- VEHICLE NUMBER ---
                CustomTextField(
                  label: "Vehicle Number",
                  hintText: "e.g. MH 03 DE 4567",
                  maxLength: 13, // 10 chars + 3 spaces
                  // Pass the custom formatting logic here
                  inputFormatters: [
                    VehicleNumberFormatter(),
                  ],
                  onChanged: (val) => notifier.setVehicleNumber(val),
                ),
                const SizedBox(height: 32),

                // --- SAFETY CHECKLIST ---
                SafetyChecklistCard(
                  wearHelmet: state.wearHelmet,
                  followSpeed: state.followSpeed,
                  thermalBag: state.thermalBag,
                  onChanged: (key, val) => notifier.updateChecklist(key, val),
                ),

                const SizedBox(height: 80), // Space for scroll

                // --- ACTION BUTTON ---
                PrimaryButton(
                  text: "Start Delivering",
                  // Button only activates if form is complete
                  onPressed: state.isFormValid
                      ? () => context.go('/home')
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