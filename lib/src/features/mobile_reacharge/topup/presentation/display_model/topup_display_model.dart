import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_option_display_model.dart';

class TopUpDisplayModel {
  final String userBalance;
  final String benefitiaryName;
  final String benefitiaryPhoneNumber;
  final List<TopUpOptionDisplayModel> topUpOptions;
  final bool canInitiateTopUp;

  TopUpDisplayModel(
      {required this.userBalance,
      required this.benefitiaryName,
      required this.benefitiaryPhoneNumber,
      required this.topUpOptions,
      required this.canInitiateTopUp});
}
