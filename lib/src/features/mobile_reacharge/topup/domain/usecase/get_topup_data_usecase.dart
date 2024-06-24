import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/repository/beneficiaries_repository.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_data.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/repository/topup_repository.dart';
import 'package:top_up/src/features/user/domain/repository/user_repository.dart';

abstract class GetTopUpDataUseCase {
  Future<TopUpData> call(String beneficiaryId);
}

class GetTopupDataUsecaseImpl extends GetTopUpDataUseCase {
  final UserRepository userRepository;
  final BeneficiariesRepository beneficiaryRepository;
  final TopUpRepository topUpRepository;

  GetTopupDataUsecaseImpl(
      {required this.userRepository, required this.beneficiaryRepository, required this.topUpRepository});

  @override
  Future<TopUpData> call(String beneficiaryId) async {
    final userInfo = await userRepository.getUserInfo();
    final beneficiaryDetails = await beneficiaryRepository.getBeneficiaryDetails(beneficiaryId);
    final topUpOptions = await topUpRepository.getTopUpOptions();
    final topUpConfig = await topUpRepository.getTopUpConfig();
    return TopUpData(
        userInfo: userInfo,
        beneficiaryDetails: beneficiaryDetails,
        topUpConfig: topUpConfig,
        topUpOptions: topUpOptions);
  }
}
