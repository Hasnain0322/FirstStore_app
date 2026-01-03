import 'package:flutter/material.dart';

class SettingsToggleRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLocked; // To disable toggle if required by business logic

  const SettingsToggleRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLocked ? Colors.grey.shade100 : Colors.grey.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: isLocked ? Colors.grey : Colors.black87,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: isLocked ? null : onChanged,
            activeColor: brandTeal,
            activeTrackColor: brandTeal.withOpacity(0.3),
            inactiveTrackColor: Colors.grey.shade200,
          )
        ],
      ),
    );
  }
}