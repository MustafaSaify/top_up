import 'package:top_up/src/features/mobile_reacharge/topup/domain/repository/topup_repository.dart';

abstract class CompleteTopUpUsecase {
  Future<void> call(String transactionId);
}

class CompleteTopupUsecaseImpl extends CompleteTopUpUsecase {
  final TopUpRepository _topUpRepository;

  CompleteTopupUsecaseImpl({required TopUpRepository topUpRepository})
      : _topUpRepository = topUpRepository;

  @override
  Future<void> call(String transactionId) {
    return _topUpRepository.completeTopUpTransaction(transactionId);
  }
}
