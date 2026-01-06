import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/profile_menu_tile.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Privacy & Security",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        // FIX: Wrap the children in a Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileMenuTile(
                title: "Privacy Policy",
                icon: Icons.description_outlined,
                onTap: () {}
            ),
            ProfileMenuTile(
                title: "Terms & Conditions",
                icon: Icons.assignment_outlined,
                onTap: () {}
            ),
            const SizedBox(height: 24),

            // Your Data Rights Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFFE0F7F5),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Data Rights",
                        style: TextStyle(color: Color(0xFF00C1AA), fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("• View or delete data anytime\n• Encryption secured",
                        style: TextStyle(color: Color(0xFF00C1AA), fontSize: 12, height: 1.5)),
                  ]
              ),
            ),

            const Spacer(), // Pushes the Danger Zone to the bottom

            // Danger Zone Box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                  children: [
                    const Text("Danger Zone",
                        style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => context.push('/delete-account'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Delete My Account",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}