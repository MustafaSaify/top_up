import 'package:dio/dio.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/remote/beneficiaries_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/datasource/remote/service/beneficiaries_service.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/data/repository/beneficiaries_repository_impl.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/repository/beneficiaries_repository.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/data/datasource/topup_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/data/repository/topup_repository_impl.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/repository/topup_repository.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/usecase/calculate_max_possible_topup_amount_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/usecase/get_topup_data_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/usecase/initiate_topup_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/mapper/topup_display_model_mapper.dart';
import 'package:top_up/src/features/user/data/datasource/user_remote_datasource.dart';
import 'package:top_up/src/features/user/data/repository/user_repository_impl.dart';
import 'package:top_up/src/features/user/domain/repository/user_repository.dart';
import 'package:top_up/src/utils/currency_formatter.dart';

class TopUpFeature {
  TopUpBloc initTopUpBloc() {
    return TopUpBloc(
      _getTopUpDataUseCase(),
      _getMaxPossibleTopUpAmountUsecase(),
      _getInitiateTopUpUseCase(),
      _getTopUpDisplayModelMapper()
    );
  }

  GetTopUpDataUseCase _getTopUpDataUseCase() {
    return GetTopupDataUsecaseImpl(
        userRepository: _getUserRepository(),
        beneficiaryRepository: _getBeneficiariesRepository(),
        topUpRepository: _getTopUpRepository());
  }

  CalculateMaxPossibleTopUpAmountUsecase _getMaxPossibleTopUpAmountUsecase() {
    return CalculateMaxPossibleTopUpAmountUsecaseImpl();
  }

  InitiateTopUpUseCase _getInitiateTopUpUseCase() {
    return InitiateTopupUsecaseImpl(topUpRepository: _getTopUpRepository());
  }

  TopUpDisplayModelMapper _getTopUpDisplayModelMapper() {
    return TopUpDisplayModelMapperImpl(currencyFormatter: CurrencyFormatterImpl());
  }

  UserRepository _getUserRepository() {
    return UserRepositoryImpl(remoteDataSource: _getUserRemoteDataSource());
  }

  UserRemoteDataSource _getUserRemoteDataSource() {
    return UserRemoteDatasourceImpl();
  }

  TopUpRepository _getTopUpRepository() {
    return TopUpRepositoryImpl(remoteDataSource: _getTopUpRemoteDataSource());
  }

  TopUpRemoteDataSource _getTopUpRemoteDataSource() {
    return TopupRemoteDataSourceImpl();
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
