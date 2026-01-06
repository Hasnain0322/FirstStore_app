import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/profile_menu_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(16)), child: const Column(children: [Text("App Settings", style: TextStyle(fontWeight: FontWeight.bold)), Text("Customize your experience", style: TextStyle(color: Colors.grey, fontSize: 12))])),
          const SizedBox(height: 24),
          ProfileMenuTile(title: "Notification Settings", icon: Icons.notifications_none, onTap: () => context.push('/notifications')),
          ProfileMenuTile(title: "Language", icon: Icons.language, onTap: () => context.push('/language')),
          ProfileMenuTile(title: "Privacy & Security", icon: Icons.lock_outline, onTap: () => context.push('/privacy')),
          ProfileMenuTile(title: "About FirstStore", icon: Icons.info_outline, onTap: () => context.push('/about')),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity, height: 55, child: OutlinedButton(onPressed: () {}, child: const Text("Logout", style: TextStyle(color: Colors.deepOrange)))),
        ]),
      ),
    );
  }
}