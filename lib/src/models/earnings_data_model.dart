class EarningsDataModel {
  final double? totalEarnings;
  final String? comparisonText; // e.g. "+18% vs last week"
  final String? onlineTime;
  final double? avgOrderValue;
  final int? peekOrders;
  final double? rating;

  // Only for Monthly View
  final List<double>? distribution; // [BasePay, Incentives, PeakBonus]

  EarningsDataModel({
    this.totalEarnings,
    this.comparisonText,
    this.onlineTime,
    this.avgOrderValue,
    this.peekOrders,
    this.rating,
    this.distribution,
  });

  int? get totalOrders => null;
}