import 'package:flutter/material.dart';

class VehicleTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const VehicleTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    final List<String> types = ["Bike", "Scooter", "Others"];

    return Row(
      children: types.map((type) {
        final bool isSelected = selectedType == type;
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () => onTypeSelected(type),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? brandTeal.withOpacity(0.1) : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? brandTeal : Colors.grey.shade400,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: isSelected ? brandTeal : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}