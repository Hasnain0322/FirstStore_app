enum OrderStatus { delivered, cancelled, returned }

class OrderModel {
  final String id;
  final OrderStatus status;
  final String amount;
  final String pickupLocation;
  final String dropLocation;
  final String pickupTime; // For Timeline
  final String finalTime;  // For Timeline (Delivered/Returned time)
  final String date;
  final String time;       // Time shown on the card
  final String customerName;
  final String? reason;

  OrderModel({
    required this.id,
    required this.status,
    required this.amount,
    required this.pickupLocation,
    required this.dropLocation,
    required this.pickupTime,
    required this.finalTime,
    required this.date,
    required this.time,
    required this.customerName,
    this.reason,
  });
}