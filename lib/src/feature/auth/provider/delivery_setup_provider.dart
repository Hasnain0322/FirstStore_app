import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
class DeliverySetupState {
  final String selectedVehicle;
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

  // INDUSTRY STANDARD: Button only enables if all requirements are met
  bool get isFormValid {
    // RegEx for format: MH 03 DE 4567
    final vehicleRegex = RegExp(r'^[A-Z]{2}\s[0-9]{2}\s[A-Z]{2}\s[0-9]{4}$');

    return selectedVehicle.isNotEmpty &&
        vehicleRegex.hasMatch(vehicleNumber) && // Strict check
        wearHelmet &&
        followSpeed &&
        thermalBag;
  }
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

  // --- THIS IS THE MISSING METHOD THAT FIXES YOUR ERROR ---
  void updateChecklist(String key, bool value) {
    if (key == 'helmet') {
      state = state.copyWith(wearHelmet: value);
    } else if (key == 'speed') {
      state = state.copyWith(followSpeed: value);
    } else if (key == 'bag') {
      state = state.copyWith(thermalBag: value);
    }
  }
}

final deliverySetupProvider =
StateNotifierProvider<DeliverySetupNotifier, DeliverySetupState>((ref) {
  return DeliverySetupNotifier();
});


class VehicleNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.toUpperCase();

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    // Remove existing spaces to re-format
    text = text.replaceAll(" ", "");

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      int index = i + 1;

      // Add spaces at standard Indian Vehicle plate positions:
      // MH(space)03(space)DE(space)4567
      if (index == 2 || index == 4 || index == 6) {
        if (index != text.length) {
          buffer.write(" ");
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}