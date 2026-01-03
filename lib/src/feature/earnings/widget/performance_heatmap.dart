import 'package:flutter/material.dart';

class PerformanceHeatmap extends StatelessWidget {
  const PerformanceHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandTeal = Color(0xFF00C1AA);
    final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    // Intensity Map (Matches the variation in your 2nd image)
    // 0: Lightest, 1: Medium-Light, 2: Medium, 3: Darkest
    final List<List<int>> heatmapData = [
      [3, 3, 1, 3, 3, 3, 3], // Week 1
      [3, 0, 2, 3, 3, 3, 3], // Week 2
      [3, 2, 3, 3, 0, 3, 3], // Week 3
      [1, 3, 3, 1, 0, 1, 0], // Week 4
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Monthly Performance Map",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 24),

          // --- 1. DAY HEADERS (M, T, W...) ---
          Row(
            children: [
              const SizedBox(width: 35), // Space for "W1" labels alignment
              ...days.map((day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(height: 12),

          // --- 2. GRID ROWS (W1, W2... + Blocks) ---
          ...List.generate(4, (weekIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  // Week Label
                  SizedBox(
                    width: 35,
                    child: Text(
                      "W${weekIndex + 1}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  // 7 Day Blocks
                  ...heatmapData[weekIndex].map((intensity) => Expanded(
                    child: Container(
                      height: 28, // Height of the block
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: _getHeatmapColor(intensity),
                        borderRadius: BorderRadius.circular(6), // Rounded corners like image
                      ),
                    ),
                  )),
                ],
              ),
            );
          }),

          const SizedBox(height: 20),

          // --- 3. LEGEND (Less ... More) ---
          Row(
            children: [
              const Text("Less", style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(width: 8),
              _buildLegendBox(0),
              _buildLegendBox(1),
              _buildLegendBox(2),
              _buildLegendBox(3),
              const SizedBox(width: 8),
              const Text("More", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  // --- Helper: Specific teal shades based on image intensity ---
  Color _getHeatmapColor(int level) {
    switch (level) {
      case 0: return const Color(0xFFE7F9F2); // Lightest
      case 1: return const Color(0xFFB2EBE4); // Medium-Light
      case 2: return const Color(0xFF5CD1C4); // Medium
      case 3: return const Color(0xFF00C1AA); // Darkest (Brand Teal)
      default: return const Color(0xFFE7F9F2);
    }
  }

  Widget _buildLegendBox(int level) {
    return Container(
      width: 14,
      height: 14,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: _getHeatmapColor(level),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}