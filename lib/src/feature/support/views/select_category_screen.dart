import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamic List of Categories (Easy to add more later from backend)
    final List<Map<String, dynamic>> categories = [
      {"name": "Payment Issue", "icon": Icons.account_balance_wallet_outlined},
      {"name": "Order Issue", "icon": Icons.inventory_2_outlined},
      {"name": "App Problem", "icon": Icons.phone_android_outlined},
      {"name": "Safety Concern", "icon": Icons.verified_user_outlined},
      {"name": "Others", "icon": Icons.help_outline_rounded},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Select Issue Category",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        // Consistent Circular Back Button
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () => context.pop(),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Text(
              "Choose the category that best describes your issue",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final category = categories[index];
                return _buildCategoryTile(
                  context,
                  category['name'],
                  category['icon'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Modular Tile Widget for Picture-Perfect consistency
  Widget _buildCategoryTile(BuildContext context, String title, IconData icon) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          // Navigates to the form and passes the category name
          context.push('/issue-form', extra: title);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F7F5), // Light Teal background for icon
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: brandTeal, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Color(0xFF2D2D2D),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      ),
    );
  }
}