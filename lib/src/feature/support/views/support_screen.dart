import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Modular Widgets
import '../widget/support_action_btn.dart';
import '../widget/support_recent_ticket_tile.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Support",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Need Help Card
            _buildNeedHelpCard(),
            const SizedBox(height: 24),

            // 2. Action Buttons Row (Modular)
            Row(
              children: [
                SupportActionBtn(
                  title: "Call Support",
                  icon: Icons.call,
                  color: brandTeal,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                SupportActionBtn(
                  title: "Chat Support",
                  icon: Icons.chat_bubble_outline,
                  color: const Color(0xFF00D15D),
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                SupportActionBtn(
                  title: "FAQs",
                  icon: Icons.menu_book,
                  color: const Color(0xFFF79E1B),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Text("Raise a Ticket",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),

            // 3. Create Ticket Entry
            _buildCreateTicketCard(context),

            const SizedBox(height: 32),

            // 4. Recent Tickets Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Tickets",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text("View All ", style: TextStyle(color: brandTeal)),
                      Icon(Icons.arrow_forward, size: 16, color: brandTeal)
                    ],
                  ),
                ),
              ],
            ),

            // 5. Ticket List (Modular)
            const SupportRecentTicketTile(id: "FS_TKT_102", status: "In Progress", type: "PaymentIssue"),
            const SupportRecentTicketTile(id: "FS_TKT_101", status: "Resolved", type: "AppProblem"),

            const SizedBox(height: 24),

            // 6. Quick Tip Box
            _buildTipBox(),
          ],
        ),
      ),
    );
  }

  // --- Private Helpers for this specific layout ---
  Widget _buildNeedHelpCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFE0F7F5), borderRadius: BorderRadius.circular(16)),
      child: const Column(
        children: [
          Text("Need Help?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("We're here to assist you 24/7", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCreateTicketCard(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/select-category'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.confirmation_number_outlined, color: Color(0xFF00C1AA)),
            SizedBox(width: 12),
            Text("Create Support Tickets", style: TextStyle(fontWeight: FontWeight.w600)),
            Spacer(),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildTipBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(12)),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, size: 18, color: Colors.orange),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Tip: For urgent issues, call us directly. For everything else, create a ticket for tracking.",
              style: TextStyle(fontSize: 12, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}