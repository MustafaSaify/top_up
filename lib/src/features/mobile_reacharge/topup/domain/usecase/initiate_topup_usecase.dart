import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/repository/topup_repository.dart';

abstract class InitiateTopUpUseCase {
  Future<TopUpSummary> call(String beneficiaryId, num amount);
}

class InitiateTopupUsecaseImpl extends InitiateTopUpUseCase {
  final TopUpRepository _topUpRepository;

  InitiateTopupUsecaseImpl({required TopUpRepository topUpRepository}) : _topUpRepository = topUpRepository;
  
  @override
  Future<TopUpSummary> call(String beneficiaryId, num amount) {
    return _topUpRepository.initiateTopUp(beneficiaryId, amount);
  }
  
}