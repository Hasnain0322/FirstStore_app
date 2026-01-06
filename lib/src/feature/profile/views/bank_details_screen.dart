import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/profile_info_banner.dart';
import '../../../common/widget//primary_button.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Bank & Payout Details"), backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(16)),
              child: const Row(children: [CircleAvatar(backgroundColor: Color(0xFF00C1AA), child: Icon(Icons.account_balance_wallet, color: Colors.white)), SizedBox(width: 16), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Payout Account", style: TextStyle(fontSize: 12)), Text("Lokesh Kumar", style: TextStyle(fontWeight: FontWeight.bold))])])),
          const SizedBox(height: 24),
          const Text("Bank Account Details", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _item("Account Holder Name", "Lokesh Kumar"),
          _item("Bank Name", "HDFC Bank"),
          _item("Account Number", "****1234"),
          _item("IFSC Code", "HDFC0001234"),
          const SizedBox(height: 24),
          const Text("UPI ID", style: TextStyle(fontWeight: FontWeight.bold)),
          _item("UPI ID", "lokesh@paytm"),
          const SizedBox(height: 24),
          const ProfileInfoBanner(message: "Your weekly payouts will be transferred to this account. Ensure details are correct.", color: Color(0xFF00C1AA)),
          const SizedBox(height: 40),
          PrimaryButton(text: "Update Bank Details", onPressed: () => context.push('/update-bank')),
        ]),
      ),
    );
  }
  Widget _item(String l, String v) => Container(width: double.infinity, margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(l, style: const TextStyle(color: Colors.grey, fontSize: 12)), Text(v, style: const TextStyle(fontWeight: FontWeight.bold))]));
}