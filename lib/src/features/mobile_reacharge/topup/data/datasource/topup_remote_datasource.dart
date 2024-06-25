import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_config.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_option.dart';

abstract class TopUpRemoteDataSource {
  Future<List<TopUpOption>> getTopUpOptions();
  Future<TopUpConfig> getTopUpConfig();
  Future<TopUpSummary> initiateTopUp(String beneficairyId, num amount);
  Future<void> completeTopUp(String transactionId);
}

class TopupRemoteDataSourceImpl extends TopUpRemoteDataSource {
  @override
  Future<List<TopUpOption>> getTopUpOptions() async {
    // Mocked response.
    final topUpOptions = [
      TopUpOption(amount: 5, currencyCode: 'AED'),
      TopUpOption(amount: 10, currencyCode: 'AED'),
      TopUpOption(amount: 20, currencyCode: 'AED'),
      TopUpOption(amount: 30, currencyCode: 'AED'),
      TopUpOption(amount: 50, currencyCode: 'AED'),
      TopUpOption(amount: 75, currencyCode: 'AED'),
      TopUpOption(amount: 100, currencyCode: 'AED')
    ];
    return topUpOptions;
  }

  @override
  Future<TopUpConfig> getTopUpConfig() async {
    // Mocked response.
    return TopUpConfig(
        serviceCharge: 1,
        verifiedUserLimit: 1000,
        unverifiedUserLimit: 500,
        totalLimit: 3000,
        currencyCode: 'AED'
      );
  }

  @override
  Future<TopUpSummary> initiateTopUp(String beneficairyId, num amount) async {
    // Mocked response.
    return TopUpSummary(
      transactionId: '2a011e5d-18f7-4410-86a6',
      beneficiaryName: 'Amit Pahandit',
      beneficiaryPhoneNumber: '+9715255219205', 
      topUpAmount: amount, 
      serviceCharge: 1,
      totalAmount: amount + 1,
      currencyCode: 'AED'
    );
  }

  @override
  Future<void> completeTopUp(String transactionId) async {
    // Mocked response.
    return;
  }
}
