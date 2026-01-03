import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Delete Account")),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
        Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(16)), child: Column(children: [const Icon(Icons.warning, color: Colors.orange, size: 40), const SizedBox(height: 16), const Text("Are you absolutely sure?", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)), Text("This action cannot be undone.", textAlign: TextAlign.center, style: TextStyle(color: Colors.red.shade300, fontSize: 12))])),
        const SizedBox(height: 24),
        const Align(alignment: Alignment.centerLeft, child: Text("What will happen:", style: TextStyle(fontWeight: FontWeight.bold))),
        const SizedBox(height: 12),
        const Text("× All personal info will be deleted\n× Earnings history will be removed\n× Active tickets will be closed", style: TextStyle(color: Colors.grey, height: 1.8)),
        const Spacer(),
        SizedBox(width: double.infinity, height: 55, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), child: const Text("I Understand, Continue"))),
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, height: 55, child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel", style: TextStyle(color: Colors.grey)))),
      ])),
    );
  }
}