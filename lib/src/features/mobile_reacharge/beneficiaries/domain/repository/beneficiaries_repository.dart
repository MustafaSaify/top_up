import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';

abstract class BeneficiariesRepository {
  Future<List<Beneficiary>> getBeneficiaries();
}
