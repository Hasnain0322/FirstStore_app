import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/earnings_data_model.dart';

enum EarningsTab { today, week, month }

class EarningsState {
  final EarningsTab selectedTab;
  final EarningsDataModel? data;

  EarningsState({this.selectedTab = EarningsTab.today, this.data});

  EarningsState copyWith({EarningsTab? selectedTab, EarningsDataModel? data}) {
    return EarningsState(
      selectedTab: selectedTab ?? this.selectedTab,
      data: data ?? this.data,
    );
  }
}

class EarningsNotifier extends StateNotifier<EarningsState> {
  EarningsNotifier() : super(EarningsState()) {
    setTab(EarningsTab.today); // Load initial mock data
  }

  void setTab(EarningsTab tab) {
    // INDUSTRY TIP: This is where you would call your API.
    // For now, we manually switch mock data.
    EarningsDataModel mockData;

    if (tab == EarningsTab.today) {
      mockData = EarningsDataModel(
        totalEarnings: 1240,
        onlineTime: "5h 20m",
        avgOrderValue: 155,
        peekOrders: 3,
        rating: 4.8,
      );
    } else if (tab == EarningsTab.week) {
      mockData = EarningsDataModel(
        totalEarnings: 7420,
        comparisonText: "+18% vs last week",
        onlineTime: "36h 20m",
        avgOrderValue: 176,
        peekOrders: 18,
        rating: 4.7,
      );
    } else {
      mockData = EarningsDataModel(
        totalEarnings: 28960,
        comparisonText: "Top 12% of riders",
        onlineTime: "160h 10m",
        avgOrderValue: 181,
        peekOrders: 82,
        rating: 4.9,
        distribution: [20400, 5760, 2800], // Base, Incentives, Peak
      );
    }

    state = state.copyWith(selectedTab: tab, data: mockData);
  }
}

final earningsProvider = StateNotifierProvider<EarningsNotifier, EarningsState>((ref) => EarningsNotifier());