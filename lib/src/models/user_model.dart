class UserProfileModel {
  final String name;
  final String phone;
  final String email;
  final double rating;
  final String profilePic;

  UserProfileModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.rating,
    required this.profilePic,
  });

  // This method is REQUIREID to fix your provider error
  UserProfileModel copyWith({
    String? name,
    String? phone,
    String? email,
    double? rating,
    String? profilePic,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      rating: rating ?? this.rating,
      profilePic: profilePic ?? this.profilePic,
    );
  }
}

class BankModel {
  final String holderName;
  final String bankName;
  final String accountNumber;
  final String ifsc;
  final String upiId;

  BankModel({
    required this.holderName,
    required this.bankName,
    required this.accountNumber,
    required this.ifsc,
    required this.upiId,
  });

  BankModel copyWith({
    String? holderName,
    String? bankName,
    String? accountNumber,
    String? ifsc,
    String? upiId,
  }) {
    return BankModel(
      holderName: holderName ?? this.holderName,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      ifsc: ifsc ?? this.ifsc,
      upiId: upiId ?? this.upiId,
    );
  }
}