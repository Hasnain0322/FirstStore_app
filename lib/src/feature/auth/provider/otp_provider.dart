import 'dart:async'; // Crucial for Timer
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpState {
  final int timerValue;
  final bool canResend;
  final String otp;

  OtpState({
    this.timerValue = 30, // Default to 30 seconds
    this.canResend = false,
    this.otp = '',
  });

  bool get isOtpComplete => otp.length == 6;

  OtpState copyWith({int? timerValue, bool? canResend, String? otp}) {
    return OtpState(
      timerValue: timerValue ?? this.timerValue,
      canResend: canResend ?? this.canResend,
      otp: otp ?? this.otp,
    );
  }
}

class OtpNotifier extends StateNotifier<OtpState> {
  // 1. Initialize the state and start the timer immediately
  OtpNotifier() : super(OtpState()) {
    _startTimer();
  }

  Timer? _timer;

  void _startTimer() {
    // Reset state for a new timer
    state = state.copyWith(timerValue: 30, canResend: false);

    // Cancel any existing timer to avoid memory leaks or multiple timers
    _timer?.cancel();

    // 2. Start a periodic timer that runs every 1 second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timerValue > 0) {
        // Decrease the timer value by 1
        state = state.copyWith(timerValue: state.timerValue - 1);
      } else {
        // Stop the timer and allow resend
        state = state.copyWith(canResend: true);
        timer.cancel();
      }
    });
  }

  void updateOtp(String value) => state = state.copyWith(otp: value);

  // Restart timer when user clicks Resend
  void resendOtp() {
    if (state.canResend) {
      _startTimer();
      // Add your API call to resend OTP here
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Important: Stop the timer when the user leaves the screen
    super.dispose();
  }
}

// 3. Define the provider
final otpProvider = StateNotifierProvider.autoDispose<OtpNotifier, OtpState>((ref) {
  return OtpNotifier();
});