class TopUpSummary {
  final String transactionId;
  final String beneficiaryName;
  final String beneficiaryPhoneNumber;
  final num topUpAmount;
  final num serviceCharge;
  final num totalAmount;
  final String currencyCode;

  TopUpSummary(
      {required this.transactionId,
      required this.beneficiaryName,
      required this.beneficiaryPhoneNumber,
      required this.topUpAmount,
      required this.serviceCharge,
      required this.totalAmount,
      required this.currencyCode});
}
