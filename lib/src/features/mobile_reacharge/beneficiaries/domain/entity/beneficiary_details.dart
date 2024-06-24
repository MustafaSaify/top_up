class BeneficiaryDetails {
  final String id;
  final String name;
  final String phoneNumber;
  final BeneficiaryTopUpDetails topUpDetails;

  BeneficiaryDetails({required this.id, required this.name, required this.phoneNumber, required this.topUpDetails});
}

class BeneficiaryTopUpDetails {
  final num monthlyTotalAmount;
  final String currencyCode;

  BeneficiaryTopUpDetails({required this.monthlyTotalAmount, required this.currencyCode});
}
