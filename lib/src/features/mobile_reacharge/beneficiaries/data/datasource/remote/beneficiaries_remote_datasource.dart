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
    //return service.getBeneficiaries();
    return [
      const Beneficiary(
          id: "6a187b88-7f26-404d-8e65-f288c8769b17", name: "Amit Pahandit", phoneNumber: "+915255219205"),
      const Beneficiary(id: "400816f5-a528-417a-bf3b-08b19ae3f9e7", name: "Kumar Suresh", phoneNumber: "+971562194020"),
    ];
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
