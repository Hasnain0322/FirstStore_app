import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widget/history_filter_bar.dart';
import '../widget/history_filter_chips.dart';
import '../widget/order_history_card.dart';
import '../providers/history_provider.dart';
import '../../../models/order_model.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(historyFilterProvider);

    // FIXED: Added all required parameters to match the new OrderModel
    final List<OrderModel> mockOrders = [
      OrderModel(
        id: "#FS1029",
        status: OrderStatus.delivered,
        amount: "₹45",
        pickupLocation: "Salt Lake Sector V",
        dropLocation: "New Town Action Area, Kolkata",
        pickupTime: "3:10 PM",
        finalTime: "3:42 PM",
        time: "3:42 PM",
        date: "25 Nov",
        customerName: "Rahul Sharma",
      ),
      OrderModel(
        id: "#FS2041",
        status: OrderStatus.cancelled,
        amount: "-",
        pickupLocation: "Salt Lake Sector V",
        dropLocation: "Salt Lake Stadium",
        pickupTime: "2:45 PM",
        finalTime: "3:15 PM",
        time: "3:15 PM",
        date: "24 Nov",
        customerName: "Rahul Sharma",
        reason: "Customer not reachable",
      ),
      OrderModel(
        id: "#FS5093",
        status: OrderStatus.returned,
        amount: "-",
        pickupLocation: "Salt Lake Sector V",
        dropLocation: "Bidhannagar",
        pickupTime: "5:10 PM",
        finalTime: "5:40 PM",
        time: "5:40 PM",
        date: "24 Nov",
        customerName: "Rahul Sharma",
        reason: "Customer refused package",
      ),
    ];

    // Dynamic Filter Logic
    final filteredList = mockOrders.where((o) =>
    filter == HistoryFilter.all || o.status.name == filter.name).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Delivery History",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const HistoryFilterBar(),
          HistoryFilterChips(
              selected: filter,
              onSelected: (f) => ref.read(historyFilterProvider.notifier).setFilter(f)
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredList.length,
              itemBuilder: (context, index) => OrderHistoryCard(
                order: filteredList[index],
                onTap: () => context.push('/history-detail', extra: filteredList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}