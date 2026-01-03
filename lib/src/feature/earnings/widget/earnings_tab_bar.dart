import 'package:flutter/material.dart';
import '../provider/earnings_provider.dart';

class EarningsTabBar extends StatelessWidget {
  final EarningsTab selectedTab;
  final Function(EarningsTab) onTabChanged;

  const EarningsTabBar({super.key, required this.selectedTab, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: EarningsTab.values.map((tab) {
        bool isSelected = selectedTab == tab;
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ChoiceChip(
            label: Text(_getLabel(tab)),
            selected: isSelected,
            onSelected: (_) => onTabChanged(tab),
            selectedColor: const Color(0xFF00C1AA),
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }

  String _getLabel(EarningsTab tab) {
    if (tab == EarningsTab.today) return "Today";
    if (tab == EarningsTab.week) return "This Week";
    return "This Month";
  }
}