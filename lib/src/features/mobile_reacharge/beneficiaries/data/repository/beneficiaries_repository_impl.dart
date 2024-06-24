import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/remote/beneficiaries_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary_details.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/repository/beneficiaries_repository.dart';

class BeneficiariesRepositoryImpl extends BeneficiariesRepository {
  final BeneficiariesRemoteDataSource remoteDatasource;

  BeneficiariesRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    return remoteDatasource.getBeneficiaries();
  }

  @override
  Future<BeneficiaryDetails> getBeneficiaryDetails(String beneficiaryId) {
    return remoteDatasource.getBeneficiaryDetails(beneficiaryId);
  }
}
