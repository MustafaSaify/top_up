import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/data/datasource/topup_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_config.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_option.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/repository/topup_repository.dart';

class TopUpRepositoryImpl extends TopUpRepository {
  final TopUpRemoteDataSource remoteDataSource;

  TopUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TopUpConfig> getTopUpConfig() {
    return remoteDataSource.getTopUpConfig();
  }

  @override
  Future<List<TopUpOption>> getTopUpOptions() {
    return remoteDataSource.getTopUpOptions();
  }

  @override
  Future<TopUpSummary> initiateTopUp(String beneficairyId, num amount) {
    return remoteDataSource.initiateTopUp(beneficairyId, amount);
  }

  @override
  Future<void> completeTopUpTransaction(String transactionId) {
    return remoteDataSource.completeTopUpTransaction(transactionId);
  }
}
