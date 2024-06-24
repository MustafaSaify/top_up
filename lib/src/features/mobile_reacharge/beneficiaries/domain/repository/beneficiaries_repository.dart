import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary_details.dart';

abstract class BeneficiariesRepository {
  Future<List<Beneficiary>> getBeneficiaries();
  Future<BeneficiaryDetails> getBeneficiaryDetails(String beneficiaryId);
}
