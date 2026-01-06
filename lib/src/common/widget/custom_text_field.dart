import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Widget? prefix;
  final int? maxLength;
  // ADD THIS: To allow custom formatting like the Vehicle Number pattern
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.prefix,
    this.maxLength,
    this.inputFormatters, // Initialize it here
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
        ],
        TextField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          // MODIFIED: Merging default logic with custom formatters
          inputFormatters: [
            // If it's a phone number, only allow digits
            if (keyboardType == TextInputType.phone)
              FilteringTextInputFormatter.digitsOnly,

            // If maxLength is provided, limit it
            if (maxLength != null)
              LengthLimitingTextInputFormatter(maxLength),

            // ADD ANY CUSTOM FORMATTERS PASSED FROM THE SCREEN
            if (inputFormatters != null)
              ...inputFormatters!,
          ],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
          decoration: InputDecoration(
            prefixIcon: prefix,
            hintText: hintText,
            counterText: "", // Cleaner look
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
              letterSpacing: 0,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF00C1AA), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}