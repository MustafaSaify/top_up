import 'package:top_up/src/features/mobile_reacharge/summary/domain/usecase/complete_topup_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/mapper/topup_summary_display_model_mapper.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/data/datasource/topup_remote_datasource.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/data/repository/topup_repository_impl.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/repository/topup_repository.dart';
import 'package:top_up/src/utils/currency_formatter.dart';

class TopUpSummaryFeature {
  TopUpSummaryBloc initTopUpSummaryBloc() {
    return TopUpSummaryBloc(
      _getTopUpSummaryDisplayModelMapper(),
      _getCompleteTopUpUseCase()
    );
  }

  TopUpSummaryDisplayModelMapper _getTopUpSummaryDisplayModelMapper() {
    return TopUpSummaryDisplayModelMapperImpl(currencyFormatter: CurrencyFormatterImpl());
  }

  CompleteTopUpUsecase _getCompleteTopUpUseCase() {
    return CompleteTopupUsecaseImpl(topUpRepository: _getTopUpRepository());
  }

  TopUpRepository _getTopUpRepository() {
    return TopUpRepositoryImpl(remoteDataSource: _getTopUpRemoteDataSource());
  }

  TopUpRemoteDataSource _getTopUpRemoteDataSource() {
    return TopupRemoteDataSourceImpl();
  }
}