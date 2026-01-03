import 'package:flutter_riverpod/flutter_riverpod.dart';

class KycState {
  final bool isLicenseUploaded;
  final bool isAadhaarUploaded;
  final bool isSelfieUploaded;

  KycState({
    this.isLicenseUploaded = false,
    this.isAadhaarUploaded = false,
    this.isSelfieUploaded = false,
  });

  // Continue button only enables if all 3 are done
  bool get isKycComplete => isLicenseUploaded && isAadhaarUploaded && isSelfieUploaded;

  KycState copyWith({bool? isLicense, bool? isAadhaar, bool? isSelfie}) {
    return KycState(
      isLicenseUploaded: isLicense ?? this.isLicenseUploaded,
      isAadhaarUploaded: isAadhaar ?? this.isAadhaarUploaded,
      isSelfieUploaded: isSelfie ?? this.isSelfieUploaded,
    );
  }
}

class KycNotifier extends StateNotifier<KycState> {
  KycNotifier() : super(KycState());

  // These will eventually trigger the Image Picker (camera/gallery)
  void uploadLicense() => state = state.copyWith(isLicense: true);
  void uploadAadhaar() => state = state.copyWith(isAadhaar: true);
  void uploadSelfie() => state = state.copyWith(isSelfie: true);
}

final kycProvider = StateNotifierProvider<KycNotifier, KycState>((ref) {
  return KycNotifier();
});