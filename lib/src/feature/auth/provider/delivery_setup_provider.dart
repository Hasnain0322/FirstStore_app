import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeliverySetupState {
  final String selectedVehicle; // Bike, Scooter, Others
  final String vehicleNumber;
  final bool wearHelmet;
  final bool followSpeed;
  final bool thermalBag;

  DeliverySetupState({
    this.selectedVehicle = '',
    this.vehicleNumber = '',
    this.wearHelmet = false,
    this.followSpeed = false,
    this.thermalBag = false,
  });

  bool get isFormValid =>
      selectedVehicle.isNotEmpty &&
          vehicleNumber.isNotEmpty &&
          wearHelmet &&
          followSpeed &&
          thermalBag;

  DeliverySetupState copyWith({
    String? selectedVehicle,
    String? vehicleNumber,
    bool? wearHelmet,
    bool? followSpeed,
    bool? thermalBag,
  }) {
    return DeliverySetupState(
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      wearHelmet: wearHelmet ?? this.wearHelmet,
      followSpeed: followSpeed ?? this.followSpeed,
      thermalBag: thermalBag ?? this.thermalBag,
    );
  }
}

class DeliverySetupNotifier extends StateNotifier<DeliverySetupState> {
  DeliverySetupNotifier() : super(DeliverySetupState());

  void setVehicle(String type) => state = state.copyWith(selectedVehicle: type);
  void setVehicleNumber(String val) => state = state.copyWith(vehicleNumber: val);
  void toggleHelmet(bool? val) => state = state.copyWith(wearHelmet: val ?? false);
  void toggleSpeed(bool? val) => state = state.copyWith(followSpeed: val ?? false);
  void toggleBag(bool? val) => state = state.copyWith(thermalBag: val ?? false);
}

final deliverySetupProvider =
StateNotifierProvider<DeliverySetupNotifier, DeliverySetupState>((ref) {
  return DeliverySetupNotifier();
});