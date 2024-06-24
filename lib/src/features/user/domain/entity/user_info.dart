class UserInfo {
  final String userId;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final WalletInfo walletInfo;

  UserInfo(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.isVerified,
      required this.walletInfo});
}

class WalletInfo {
  final num balance;
  final num totalMonthlyTopUpAmount;
  final String currencyCode;

  WalletInfo({required this.balance, required this.totalMonthlyTopUpAmount, required this.currencyCode});
}
