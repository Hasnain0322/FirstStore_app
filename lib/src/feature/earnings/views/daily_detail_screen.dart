import 'package:flutter/material.dart';
import '../../../models/order_item_model.dart';
import '../widget/daily_summary_card.dart';
import '../widget/daily_order_item.dart';

class DailyOrderDetailScreen extends StatelessWidget {
  const DailyOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Industry standard: Mock data representing what the API will send
    final List<OrderItemModel> dayOrders = [
      OrderItemModel(id: "#FS1029", price: "₹124", timeDetails: "3:45 PM | Base Fare + Distance"),
      OrderItemModel(id: "#FS1030", price: "₹180", timeDetails: "4:15 PM | Peak Hour Bonus"),
      OrderItemModel(id: "#FS1031", price: "₹150", timeDetails: "5:00 PM | Base Fare + Distance"),
      OrderItemModel(id: "#FS1032", price: "₹200", timeDetails: "5:30 PM | Long Distance + Incentive"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Wed, 26 Nov",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const BackButton(color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: dayOrders.length + 2, // +2 for Summary Card and Header text
        itemBuilder: (context, index) {
          if (index == 0) {
            return const DailySummaryCard(
              totalEarnings: "₹ 1,240",
              stats: "8 orders | 5h 20m online",
            );
          }
          if (index == 1) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Order Breakdown",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            );
          }
          // The actual order list items
          final order = dayOrders[index - 2];
          return DailyOrderItem(order: order);
        },
      ),
    );
  }
}