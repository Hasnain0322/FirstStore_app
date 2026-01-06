import 'package:flutter/material.dart';

class KycUploadTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isUploaded;
  final VoidCallback onTap;

  const KycUploadTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isUploaded = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    const Color lightTeal = Color(0xFFE0F7F5);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: lightTeal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.file_upload_outlined, color: brandTeal, size: 24),
            ),
            const SizedBox(width: 16),
            // Text details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF161616),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                ],
              ),
            ),
            // Status Checkmark
            if (isUploaded)
              const Icon(Icons.check_circle, color: brandTeal, size: 24)
            else
              Icon(Icons.chevron_right, color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}