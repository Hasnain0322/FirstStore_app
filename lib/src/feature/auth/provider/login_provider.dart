import 'package:flutter_riverpod/flutter_riverpod.dart';

// This class holds the data
class LoginState {
  final String mobileNumber;
  final bool isAgreed;
  LoginState({this.mobileNumber = '', this.isAgreed = false});

  bool get isFormValid => mobileNumber.length == 10 && isAgreed;

  LoginState copyWith({String? mobileNumber, bool? isAgreed}) {
    return LoginState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      isAgreed: isAgreed ?? this.isAgreed,
    );
  }
}

// This class manages the logic
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  void updateNumber(String value) => state = state.copyWith(mobileNumber: value);
  void toggleAgreement(bool? value) => state = state.copyWith(isAgreed: value ?? false);
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});