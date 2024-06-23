import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/beneficiaries_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';

class BeneficiariesRemoteDataSourceImpl extends BeneficiariesRemoteDataSource {
  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    final beneficiaries = [
      Beneficiary(id: '111', name: 'John Smith', phoneNumber: '9191919191'),
      Beneficiary(id: '222', name: 'Alex Roy', phoneNumber: '9292929292'),
      Beneficiary(id: '333', name: 'Tim David', phoneNumber: '9393939393'),
    ];
    return beneficiaries;
  }
}
