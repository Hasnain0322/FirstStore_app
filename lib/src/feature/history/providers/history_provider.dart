import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HistoryFilter { all, delivered, cancelled, returned }

class HistoryNotifier extends StateNotifier<HistoryFilter> {
  HistoryNotifier() : super(HistoryFilter.all);

  void setFilter(HistoryFilter filter) => state = filter;
}

final historyFilterProvider = StateNotifierProvider<HistoryNotifier, HistoryFilter>((ref) => HistoryNotifier());
