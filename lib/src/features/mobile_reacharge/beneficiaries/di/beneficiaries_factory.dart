import 'package:dio/dio.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/remote/beneficiaries_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/remote/service/beneficiaries_service.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/repository/beneficiaries_repository_impl.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/repository/beneficiaries_repository.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_bloc.dart';

class BeneficiariesFeature {
  BeneficiariesBloc initBeneficiariesBloc() {
    return BeneficiariesBloc(
      beneficiariesRepository: _getBeneficiariesRepository(),
    );
  }

  BeneficiariesRepository _getBeneficiariesRepository() {
    return BeneficiariesRepositoryImpl(remoteDatasource: _getBeneficiariesRemoteDatasource());
  }

  BeneficiariesRemoteDataSource _getBeneficiariesRemoteDatasource() {
    return BeneficiariesRemoteDataSourceImpl(service: _getBeneficiariesService());
  }

  BeneficiariesService _getBeneficiariesService() {
    return BeneficiariesService(Dio(BaseOptions(contentType: "application/json")));
  }
}
