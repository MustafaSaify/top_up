class TopUpConfig {
  final num serviceCharge;
  final num verifiedUserLimit;
  final num unverifiedUserLimit;
  final num totalLimit;
  final String currencyCode;

  TopUpConfig(
      {required this.serviceCharge,
      required this.verifiedUserLimit,
      required this.unverifiedUserLimit,
      required this.totalLimit,
      required this.currencyCode});
}
