import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary_details.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_option.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_display_model.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_option_display_model.dart';
import 'package:top_up/src/features/user/domain/entity/user_info.dart';
import 'package:top_up/src/utils/currency_formatter.dart';

abstract class TopUpDisplayModelMapper {
  TopUpDisplayModel map(UserInfo userInfo, BeneficiaryDetails beneficiaryDetails, List<TopUpOption> topUpOptions,
      num selectedAmount, num maxPossibleTopUpAmount);
}

class TopUpDisplayModelMapperImpl extends TopUpDisplayModelMapper {
  final CurrencyFormatter currencyFormatter;

  TopUpDisplayModelMapperImpl({required this.currencyFormatter});

  @override
  TopUpDisplayModel map(UserInfo userInfo, BeneficiaryDetails beneficiaryDetails, List<TopUpOption> topUpOptions,
      num selectedAmount, num maxPossibleTopUpAmount) {
    final userBalance = currencyFormatter.formatCurrency(userInfo.walletInfo.balance, userInfo.walletInfo.currencyCode);

    return TopUpDisplayModel(
        userBalance: userBalance,
        benefitiaryName: beneficiaryDetails.name,
        benefitiaryPhoneNumber: beneficiaryDetails.phoneNumber,
        topUpOptions: _mapTopUpOptions(topUpOptions, selectedAmount, maxPossibleTopUpAmount),
        canInitiateTopUp: selectedAmount > 0);
  }

  List<TopUpOptionDisplayModel> _mapTopUpOptions(
      List<TopUpOption> topUpOptions, num selectedAmount, num maxPossibleTopUpAmount) {
    return topUpOptions
        .map((topUpOption) => TopUpOptionDisplayModel(
            amount: topUpOption.amount,
            formattedAmount: currencyFormatter.formatCurrency(topUpOption.amount, topUpOption.currencyCode),
            isSelected: selectedAmount == topUpOption.amount,
            isEnabled: topUpOption.amount <= maxPossibleTopUpAmount))
        .toList();
  }
}
