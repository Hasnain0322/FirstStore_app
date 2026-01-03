import 'package:flutter/material.dart';
import '../providers/history_provider.dart'; // Import to access HistoryFilter enum

class HistoryFilterChips extends StatelessWidget {
  final HistoryFilter selected;
  final Function(HistoryFilter) onSelected;

  const HistoryFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: HistoryFilter.values.map((filter) {
          final isSelected = selected == filter;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              // Convert enum name to uppercase for professional look (ALL, DELIVERED...)
              label: Text(filter.name.toUpperCase()),

              // Styling text based on selection
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),

              selected: isSelected,

              // Callback when user taps the chip
              onSelected: (bool value) {
                if (value) onSelected(filter);
              },

              // Visual Styles to match Figma
              selectedColor: brandTeal,
              backgroundColor: const Color(0xFFF9F9F9),
              showCheckmark: false, // Removes the default checkmark for a cleaner UI

              // Shape and Border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isSelected ? brandTeal : Colors.grey.shade300,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}