class OrderItemModel {
  final String id;
  final String price;
  final String timeDetails; // e.g., "3:45 PM | Base Fare + Distance"

  OrderItemModel({
    required this.id,
    required this.price,
    required this.timeDetails,
  });
}