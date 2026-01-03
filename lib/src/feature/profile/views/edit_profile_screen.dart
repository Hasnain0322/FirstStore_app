import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/views/custom_text_field.dart';
import '../../../common/views/primary_button.dart';
import '../widget/profile_info_banner.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Edit Profile", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Center(child: Stack(children: [
            const CircleAvatar(radius: 50, backgroundColor: Color(0xFFF9F9F9), child: Text("LK", style: TextStyle(fontSize: 28))),
            Positioned(bottom: 0, right: 0, child: CircleAvatar(radius: 18, backgroundColor: const Color(0xFF00C1AA), child: const Icon(Icons.camera_alt, size: 18, color: Colors.white))),
          ])),
          const SizedBox(height: 32),
          const CustomTextField(label: "Name *", hintText: "Lokesh Kumar"),
          const SizedBox(height: 16),
          const CustomTextField(label: "Email", hintText: "lokesh.kumar@example.com"),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const Expanded(child: CustomTextField(label: "Phone Number *", hintText: "+91 98765 43210")),
            const SizedBox(width: 12),
            SizedBox(height: 55, child: ElevatedButton(onPressed: () => context.push('/change-phone'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00C1AA), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text("Change"))),
          ]),
          const SizedBox(height: 24),
          const ProfileInfoBanner(message: "Your profile information is used for account identification and support purposes.", color: Color(0xFF00C1AA)),
          const SizedBox(height: 40),
          PrimaryButton(text: "Save Changes", onPressed: () => context.pop()),
        ]),
      ),
    );
  }
}