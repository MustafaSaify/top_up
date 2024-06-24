import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary_details.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_config.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_option.dart';
import 'package:top_up/src/features/user/domain/entity/user_info.dart';

class TopUpData {
  final UserInfo userInfo;
  final BeneficiaryDetails beneficiaryDetails;
  final TopUpConfig topUpConfig;
  final List<TopUpOption> topUpOptions;

  TopUpData(
      {required this.userInfo,
      required this.beneficiaryDetails,
      required this.topUpConfig,
      required this.topUpOptions});
}
