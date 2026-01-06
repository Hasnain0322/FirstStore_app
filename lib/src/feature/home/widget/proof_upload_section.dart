import 'package:flutter/material.dart';

class ProofUploadSection extends StatelessWidget {
  final VoidCallback onTakePhoto;
  final bool hasImage;

  const ProofUploadSection({super.key, required this.onTakePhoto, this.hasImage = false});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Proof of Delivery", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Text("Take a clear photo of the delivered package", style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(16),
            // Standard Industry Tip: For a dashed border, we use a custom painter or a package,
            // but for this UI we'll use a clean subtle border.
            border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFE0F7F5),
                child: Icon(Icons.camera_alt_outlined, color: brandTeal, size: 28),
              ),
              const SizedBox(height: 12),
              const Text("No Photo Uploaded", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A))),
              const Text("Capture a clear photo showing the package", style: TextStyle(color: Colors.grey, fontSize: 11)),
              const SizedBox(height: 20),
              // Take Photo Button
              ElevatedButton.icon(
                onPressed: onTakePhoto,
                icon: const Icon(Icons.camera_alt, size: 18),
                label: const Text("Take Photo"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: brandTeal,
                  elevation: 0,
                  side: const BorderSide(color: brandTeal),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}