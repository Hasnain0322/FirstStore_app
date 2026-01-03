import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("About FirstStore")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(width: double.infinity, padding: const EdgeInsets.all(40), decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(20)), child: Column(children: [const Icon(Icons.shopping_bag_outlined, size: 50), const SizedBox(height: 12), const Text("FirstStore", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), const Text("Delivery Partner App", style: TextStyle(color: Colors.grey))])),
          const SizedBox(height: 24),
          _tile("Version", "2.5.0"),
          _tile("Build Number", "250"),
          _tile("Release Date", "November 2025"),
          const SizedBox(height: 24),
          Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("What's New", style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 8), Text("• Enhanced navigation\n• Bug fixes", style: TextStyle(color: Colors.grey, height: 1.6))])),
          const SizedBox(height: 100),
          const Text("© 2024 FirstStore. All rights reserved.", style: TextStyle(color: Colors.grey, fontSize: 11)),
        ]),
      ),
    );
  }
  Widget _tile(String l, String v) => ListTile(title: Text(l, style: const TextStyle(fontSize: 14)), trailing: Text(v, style: const TextStyle(fontWeight: FontWeight.bold)));
}