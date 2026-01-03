import 'package:flutter/material.dart';
import '../widget/settings_toggle_row.dart';
import '../widget/profile_info_banner.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Notification Settings")),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const ProfileInfoBanner(message: "Manage Notifications\nChoose what you want to be notified about", color: Color(0xFF00C1AA)),
        const SizedBox(height: 24),
        SettingsToggleRow(title: "Delivery Alerts", value: true, isLocked: true, onChanged: (v) {}),
        SettingsToggleRow(title: "Earnings & Payout Updates", value: true, onChanged: (v) {}),
        SettingsToggleRow(title: "Support Ticket Replies", value: true, onChanged: (v) {}),
        SettingsToggleRow(title: "Promotional & Marketing", value: false, onChanged: (v) {}),
        SettingsToggleRow(title: "App Updates", value: true, onChanged: (v) {}),
        const SizedBox(height: 20),
        const ProfileInfoBanner(message: "💡 Delivery Alerts cannot be turned off as they are essential for operations.", color: Color(0xFF00C1AA)),
      ]),
    );
  }
}