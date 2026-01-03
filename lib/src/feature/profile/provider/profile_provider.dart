import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/profile_models.dart';

class ProfileState {
  final UserProfileModel user;
  final BankModel bank;
  final String selectedLanguage;
  final bool deliveryAlerts;

  ProfileState({
    required this.user,
    required this.bank,
    this.selectedLanguage = "English",
    this.deliveryAlerts = true,
  });

  // FIXED: Parameter names now match the class fields for clarity
  ProfileState copyWith({
    UserProfileModel? user,
    BankModel? bank,
    String? selectedLanguage,
    bool? deliveryAlerts,
  }) {
    return ProfileState(
      user: user ?? this.user,
      bank: bank ?? this.bank,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      deliveryAlerts: deliveryAlerts ?? this.deliveryAlerts,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier()
      : super(ProfileState(
    user: UserProfileModel(
      name: "Lokesh Kumar",
      phone: "98765 43210",
      email: "lokesh.kumar@example.com",
      rating: 4.8,
      profilePic: "",
    ),
    bank: BankModel(
      holderName: "Lokesh Kumar",
      bankName: "HDFC Bank",
      accountNumber: "****1234",
      ifsc: "HDFC0001234",
      upiId: "lokesh@paytm",
    ),
  ));

  // This will now work because we added copyWith to UserProfileModel
  void updateName(String newName) {
    state = state.copyWith(user: state.user.copyWith(name: newName));
  }

  void setLanguage(String lang) {
    state = state.copyWith(selectedLanguage: lang);
  }

  void toggleAlerts(bool val) {
    state = state.copyWith(deliveryAlerts: val);
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});