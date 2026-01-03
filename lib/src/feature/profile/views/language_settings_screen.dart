import 'package:flutter/material.dart';
import '../widget/language_selection_tile.dart';
import '../widget/profile_info_banner.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Language Settings")),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const ProfileInfoBanner(message: "Select Language\nChoose your preferred language", color: Color(0xFF00C1AA)),
        const SizedBox(height: 24),
        LanguageSelectionTile(languageName: "English", nativeName: "English", welcomeMessage: "Welcome to FirstStore", isSelected: true, onTap: () {}),
        LanguageSelectionTile(languageName: "Hindi", nativeName: "हिंदी", welcomeMessage: "FirstStore में आपका स्वागत है", isSelected: false, onTap: () {}),
        LanguageSelectionTile(languageName: "Bengali", nativeName: "বাংলা", welcomeMessage: "FirstStore এ আপনাকে স্বাগতম", isSelected: false, onTap: () {}),
        const SizedBox(height: 24),
        const ProfileInfoBanner(message: "The app will reload when you change the language.", color: Color(0xFF00C1AA)),
      ]),
    );
  }
}