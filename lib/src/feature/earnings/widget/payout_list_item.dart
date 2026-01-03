import 'package:flutter/material.dart';
import '../../../models/payout_model.dart';

class PayoutListItem extends StatelessWidget {
  final PayoutModel payout;

  const PayoutListItem({super.key, required this.payout});

  @override
  Widget build(BuildContext context) {
    // Determine badge color based on status
    final bool isCompleted = payout.status.toLowerCase() == 'completed';
    final Color statusColor = isCompleted ? const Color(0xFF00C1AA) : Colors.orange;
    final Color statusBg = isCompleted ? const Color(0xFFE7F9F2) : const Color(0xFFFFF3E0);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(
            payout.date,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text("To ${payout.bankName}",
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              // DYNAMIC STATUS BADGE
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(isCompleted ? Icons.check : Icons.access_time,
                        size: 12, color: statusColor),
                    const SizedBox(width: 4),
                    Text(
                      payout.status,
                      style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          trailing: Text(
            payout.amount,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}