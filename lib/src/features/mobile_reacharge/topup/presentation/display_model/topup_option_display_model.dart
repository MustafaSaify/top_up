class TopUpOptionDisplayModel {
  final num amount;
  final String formattedAmount;
  final bool isSelected;
  final bool isEnabled;

  TopUpOptionDisplayModel(
      {required this.amount, required this.formattedAmount, required this.isSelected, required this.isEnabled});
}
