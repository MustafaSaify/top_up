import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_config.dart';
import 'package:top_up/src/features/user/domain/entity/user_info.dart';

abstract class CalculateMaxPossibleTopUpAmountUsecase {
  num call({required UserInfo userInfo, required num beneficiaryMonthlyTotal, required TopUpConfig topUpConfig});
}

class CalculateMaxPossibleTopUpAmountUsecaseImpl extends CalculateMaxPossibleTopUpAmountUsecase {
  @override
  num call({required UserInfo userInfo, required num beneficiaryMonthlyTotal, required TopUpConfig topUpConfig}) {
    final num serviceCharge = topUpConfig.serviceCharge;
    final num beneficiaryLimit = userInfo.isVerified ? topUpConfig.verifiedUserLimit : topUpConfig.unverifiedUserLimit;
    final num remainingBeneficiaryLimit = beneficiaryLimit - beneficiaryMonthlyTotal;
    final num remainingTotalLimit = topUpConfig.totalLimit - userInfo.walletInfo.totalMonthlyTopUpAmount;
    final num remainingWalletBalance = userInfo.walletInfo.balance - serviceCharge;

    return [
      remainingBeneficiaryLimit,
      remainingTotalLimit,
      remainingWalletBalance,
    ].reduce((value, element) => value < element ? value : element);
  }
}
