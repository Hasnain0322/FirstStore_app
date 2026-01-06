import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final String countryCode;
  final String phoneNumber;
  final bool isAgreed;

  LoginState({
    this.countryCode = "+91",
    this.phoneNumber = "",
    this.isAgreed = false,
  });

  // INDUSTRY RULE: Exactly 10 digits + Checkbox ticked
  bool get isFormValid => phoneNumber.length == 10 && isAgreed;

  LoginState copyWith({String? countryCode, String? phoneNumber, bool? isAgreed}) {
    return LoginState(
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAgreed: isAgreed ?? this.isAgreed,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  void updateNumber(String value) => state = state.copyWith(phoneNumber: value);
  void updateCountryCode(String code) => state = state.copyWith(countryCode: code);
  void toggleAgreement(bool? value) => state = state.copyWith(isAgreed: value ?? false);
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) => LoginNotifier());