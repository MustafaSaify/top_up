import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';

abstract class BeneficiariesRemoteDataSource {
  Future<List<Beneficiary>> getBeneficiaries();
}
