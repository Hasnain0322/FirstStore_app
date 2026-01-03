import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupportState {
  final String selectedPriority; // Low, Medium, High
  final String selectedFrequency; // Always, Sometimes, Once
  final List<String> selectedQuickIssues;

  SupportState({
    this.selectedPriority = 'Medium',
    this.selectedFrequency = '',
    this.selectedQuickIssues = const [],
  });

  SupportState copyWith({
    String? selectedPriority,
    String? selectedFrequency,
    List<String>? selectedQuickIssues,
  }) {
    return SupportState(
      selectedPriority: selectedPriority ?? this.selectedPriority,
      selectedFrequency: selectedFrequency ?? this.selectedFrequency,
      selectedQuickIssues: selectedQuickIssues ?? this.selectedQuickIssues,
    );
  }
}

class SupportNotifier extends StateNotifier<SupportState> {
  SupportNotifier() : super(SupportState());

  void setPriority(String p) => state = state.copyWith(selectedPriority: p);
  void setFrequency(String f) => state = state.copyWith(selectedFrequency: f);

  void toggleQuickIssue(String issue) {
    var list = List<String>.from(state.selectedQuickIssues);
    if (list.contains(issue)) {
      list.remove(issue);
    } else {
      list.add(issue);
    }
    state = state.copyWith(selectedQuickIssues: list);
  }
}

final supportProvider = StateNotifierProvider<SupportNotifier, SupportState>((ref) {
  return SupportNotifier();
});