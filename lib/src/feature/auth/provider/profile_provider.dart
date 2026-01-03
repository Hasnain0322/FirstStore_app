import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileState {
  final String fullName;
  final String email;

  ProfileState({this.fullName = '', this.email = ''});

  // Basic validation: Name not empty and Email contains @
  bool get isFormValid => fullName.trim().isNotEmpty && email.contains('@');

  ProfileState copyWith({String? fullName, String? email}) {
    return ProfileState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState());

  void updateName(String value) => state = state.copyWith(fullName: value);
  void updateEmail(String value) => state = state.copyWith(email: value);
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});