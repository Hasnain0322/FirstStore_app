class OrderRequestModel {
  final String id;
  final String pickupLocation;
  final String dropLocation;
  final double pickupDistance; // in km
  final double dropDistance;   // in km
  final double estimatedEarnings;
  final String estimatedTime;

  OrderRequestModel({
    required this.id,
    required this.pickupLocation,
    required this.dropLocation,
    required this.pickupDistance,
    required this.dropDistance,
    required this.estimatedEarnings,
    required this.estimatedTime,
  });
}