import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/payout_model.dart';

// This acts as your "Mock Database" for now
final payoutHistoryProvider = Provider<List<PayoutModel>>((ref) {
  return [
    PayoutModel(date: "Fri, 21 Nov", amount: "₹3,450", bankName: "HDFC Bank", status: "Completed"),
    PayoutModel(date: "Fri, 14 Nov", amount: "₹4,200", bankName: "HDFC Bank", status: "Completed"),
    PayoutModel(date: "Fri, 07 Nov", amount: "₹3,890", bankName: "HDFC Bank", status: "Pending"),
  ];
});