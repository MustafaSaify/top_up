import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/remote/service/beneficiaries_service.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary_details.dart';

abstract class BeneficiariesRemoteDataSource {
  Future<List<Beneficiary>> getBeneficiaries();
  Future<BeneficiaryDetails> getBeneficiaryDetails(String beneficiaryId);
}

class BeneficiariesRemoteDataSourceImpl extends BeneficiariesRemoteDataSource {
  final BeneficiariesService service;

  BeneficiariesRemoteDataSourceImpl({required this.service});

  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    return service.getBeneficiaries();
  }

  @override
  Future<BeneficiaryDetails> getBeneficiaryDetails(String beneficiaryId) async {
    return BeneficiaryDetails(
        id: '6a187b88-7f26-404d-8e65-f288c8769b17',
        name: 'Amit Pahandit',
        phoneNumber: '+9715255219205',
        topUpDetails: BeneficiaryTopUpDetails(monthlyTotalAmount: 450, currencyCode: 'AED'));
  }
}
