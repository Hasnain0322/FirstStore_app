enum OrderProcessStatus { accepted, navigatingToStore, arrivedAtStore, pickedUp, delivering, delivered }

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({required this.name, required this.quantity, required this.price});
}

class ActiveOrderModel {
  final String orderId;
  final String pickupLocation;
  final String dropLocation;
  final double pickupDistance;
  final double dropDistance;
  final double earnings;
  final List<OrderItem> items;
  final OrderProcessStatus status;
  final String storeInstructions;

  // --- ADDED THESE 4 FIELDS TO FIX YOUR ERRORS ---
  final String customerName;
  final String pickupTime;
  final String finalTime;
  final String date;

  ActiveOrderModel({
    required this.orderId,
    required this.pickupLocation,
    required this.dropLocation,
    required this.pickupDistance,
    required this.dropDistance,
    required this.earnings,
    required this.items,
    required this.customerName, // Added
    required this.pickupTime,   // Added
    required this.finalTime,    // Added
    required this.date,         // Added
    this.status = OrderProcessStatus.accepted,
    this.storeInstructions = "Park near entrance. Show order ID to store manager.",
  });

  double get totalOrderValue => items.fold(0, (sum, item) => sum + item.price);

  // Updated copyWith to include the new fields
  ActiveOrderModel copyWith({
    String? orderId,
    String? pickupLocation,
    String? dropLocation,
    double? pickupDistance,
    double? dropDistance,
    double? earnings,
    List<OrderItem>? items,
    OrderProcessStatus? status,
    String? storeInstructions,
    String? customerName,
    String? pickupTime,
    String? finalTime,
    String? date,
  }) {
    return ActiveOrderModel(
      orderId: orderId ?? this.orderId,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropLocation: dropLocation ?? this.dropLocation,
      pickupDistance: pickupDistance ?? this.pickupDistance,
      dropDistance: dropDistance ?? this.dropDistance,
      earnings: earnings ?? this.earnings,
      items: items ?? this.items,
      status: status ?? this.status,
      storeInstructions: storeInstructions ?? this.storeInstructions,
      customerName: customerName ?? this.customerName,
      pickupTime: pickupTime ?? this.pickupTime,
      finalTime: finalTime ?? this.finalTime,
      date: date ?? this.date,
    );
  }
}