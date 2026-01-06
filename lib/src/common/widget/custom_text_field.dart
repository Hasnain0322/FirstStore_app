import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for Formatters

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Widget? prefix;
  final int? maxLength; // Added to restrict length

  const CustomTextField({
    super.key,
    this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.prefix,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 10),
        ],
        TextField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          // INDUSTRY STANDARD: Prevent non-numeric entry and limit length
          inputFormatters: [
            if (keyboardType == TextInputType.phone || keyboardType == TextInputType.number)
              FilteringTextInputFormatter.digitsOnly,
            if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
          ],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          decoration: InputDecoration(
            prefixIcon: prefix,
            hintText: hintText,
            counterText: "", // Hides the 0/10 counter for a cleaner UI
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14, letterSpacing: 0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF00C1AA), width: 1.5)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}