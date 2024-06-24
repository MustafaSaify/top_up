import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_config.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_option.dart';

abstract class TopUpRepository {
  Future<List<TopUpOption>> getTopUpOptions();
  Future<TopUpConfig> getTopUpConfig();
  Future<TopUpSummary> initiateTopUp(String beneficairyId, num amount);
  Future<void> completeTopUp(String transactionId);
}
