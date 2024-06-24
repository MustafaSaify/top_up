import 'package:top_up/src/features/user/domain/entity/user_info.dart';

abstract class UserRemoteDataSource {
  Future<UserInfo> getUserInfo();
}

class UserRemoteDatasourceImpl extends UserRemoteDataSource {
  @override
  Future<UserInfo> getUserInfo() async {
    return UserInfo(
        userId: '93hbsj-dnlkshd-7sdsd7s-d2332nd',
        firstName: 'John',
        lastName: 'Doe',
        isVerified: true,
        walletInfo: WalletInfo(balance: 80, totalMonthlyTopUpAmount: 450, currencyCode: 'AED'));
  }
}
