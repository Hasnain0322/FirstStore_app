import 'package:flutter/material.dart';

class SupportSegmentedToggle extends StatelessWidget {
  final String label;
  final List<String> options;
  final String selectedValue;
  final Function(String) onChanged;

  const SupportSegmentedToggle({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: options.map((opt) {
            bool isSelected = selectedValue == opt;
            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(opt),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? brandTeal : Colors.white,
                    border: Border.all(color: isSelected ? brandTeal : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(opt,
                        style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}