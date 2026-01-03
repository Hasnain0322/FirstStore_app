class PayoutModel {
  final String date;
  final String amount;
  final String bankName;
  final String status; // e.g., "Completed", "Pending"

  PayoutModel({
    required this.date,
    required this.amount,
    required this.bankName,
    required this.status,
  });
}