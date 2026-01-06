import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/profile_provider.dart';
import '../widget/profile_menu_tile.dart';

class ProfileMainScreen extends ConsumerWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(profileProvider).user;
    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header User Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: brandTeal, borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                CircleAvatar(radius: 35, backgroundColor: Colors.white24, child: Text(user.name.substring(0, 2).toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
                const SizedBox(width: 16),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(user.name, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("+91 ${user.phone}", style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.star, color: Colors.orange, size: 16), Text(" ${user.rating}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
                ])
              ]),
            ),
            const SizedBox(height: 24),
            ProfileMenuTile(title: "Edit Profile", icon: Icons.person_outline, onTap: () => context.push('/edit-profile')),
            ProfileMenuTile(title: "Bank & Payout Details", icon: Icons.account_balance_wallet_outlined, onTap: () => context.push('/bank-details')),
            ProfileMenuTile(title: "App Settings", icon: Icons.settings_outlined, onTap: () => context.push('/settings')),
            ProfileMenuTile(title: "Help & Support", icon: Icons.help_outline, onTap: () => context.push('/support')),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity, height: 55, child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.deepOrange),
              label: const Text("Logout", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.deepOrange), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            )),
            const SizedBox(height: 40),
            const Text("FirstStore v2.5.0", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}