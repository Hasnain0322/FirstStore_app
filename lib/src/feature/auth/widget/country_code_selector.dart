import 'package:flutter/material.dart';

class CountryCodeSelector extends StatelessWidget {
  final String selectedCode;
  const CountryCodeSelector({super.key, required this.selectedCode});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                const Text("🇮🇳", style: TextStyle(fontSize: 18)),
                const SizedBox(width: 6),
                Text(selectedCode, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          ),
          VerticalDivider(color: Colors.grey.shade300, thickness: 1, indent: 14, endIndent: 14),
        ],
      ),
    );
  }
}