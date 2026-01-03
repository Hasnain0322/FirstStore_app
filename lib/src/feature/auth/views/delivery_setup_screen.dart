import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../common/views/primary_button.dart';
import '../../../common/views/auth_header.dart';
import '../../../common/views/custom_text_field.dart';
import '../provider/delivery_setup_provider.dart';

class DeliverySetupScreen extends ConsumerWidget {
  const DeliverySetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliverySetupProvider);
    final notifier = ref.read(deliverySetupProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(),
            const SizedBox(height: 32),
            const Text('Setup Your Delivery Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Add your vehicle details and complete training',
                style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 32),
            const Text('Vehicle Type', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // Selection Row
            Row(
              children: [
                _buildVehicleChip('Bike', state.selectedVehicle == 'Bike', notifier),
                const SizedBox(width: 10),
                _buildVehicleChip('Scooter', state.selectedVehicle == 'Scooter', notifier),
                const SizedBox(width: 10),
                _buildVehicleChip('Others', state.selectedVehicle == 'Others', notifier),
              ],
            ),

            const SizedBox(height: 24),

            // Reusing CustomTextField
            CustomTextField(
              label: 'Vehicle Number',
              hintText: 'e.g. DL 01 AB 1234',
              onChanged: notifier.setVehicleNumber,
            ),

            const SizedBox(height: 32),

            // Safety Checklist Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F9F8), // Light blue-green tint from Figma
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Safety & Training Checklist',
                      style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF4A4A4A))),
                  const SizedBox(height: 16),
                  _buildCheckItem('Wear Helmet', state.wearHelmet, notifier.toggleHelmet),
                  _buildCheckItem('Follow Speed Limits', state.followSpeed, notifier.toggleSpeed),
                  _buildCheckItem('Keep thermal bag ready', state.thermalBag, notifier.toggleBag),
                ],
              ),
            ),

            const SizedBox(height: 100), // Space for button

            PrimaryButton(
              text: 'Start Delivering',
              onPressed: state.isFormValid ? () {
                context.go('/home'); // Use context.go to clear the auth stack
              } : null,
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Vehicle Chips
  Widget _buildVehicleChip(String label, bool isSelected, DeliverySetupNotifier notifier) {
    return GestureDetector(
      onTap: () => notifier.setVehicle(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00C1AA).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF00C1AA) : Colors.grey.shade400,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(label, style: TextStyle(
          color: isSelected ? const Color(0xFF00C1AA) : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        )),
      ),
    );
  }

  // Helper for Checklist Items
  Widget _buildCheckItem(String title, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            height: 24, width: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF00C1AA),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 14, color: Color(0xFF6A6A6A))),
        ],
      ),
    );
  }
}