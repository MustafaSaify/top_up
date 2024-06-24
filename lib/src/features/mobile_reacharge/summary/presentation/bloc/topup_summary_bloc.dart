import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/usecase/complete_topup_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_event.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_state.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/mapper/topup_summary_display_model_mapper.dart';

class TopUpSummaryBloc extends Bloc<TopUpSummaryEvent, TopUpSummaryState> {
  
  final TopUpSummaryDisplayModelMapper displayModelMapper;
  final CompleteTopUpUsecase completeTopUpUsecase;

  TopUpSummaryBloc(this.displayModelMapper, this.completeTopUpUsecase)
    : super(const InitialState()) {
    on<PageLoadEvent>(_handlePageLoadEvent);
    on<CompleteTopUpEvent>(_completeTopUp);
  }

  Future<void> _handlePageLoadEvent(
    PageLoadEvent event,
    Emitter<TopUpSummaryState> emit,
  ) async {
    final summaryItems = displayModelMapper.map(event.summary);
    emit(LoadedState(summaryItems: summaryItems));
  }

  Future<void> _completeTopUp(
    CompleteTopUpEvent event,
    Emitter<TopUpSummaryState> emit,
  ) async {
    try {
      await completeTopUpUsecase(event.transactionId);
      emit(TopUpSuccessState());
    }
    catch(e) {
      emit(const TopUpFailedState(message: 'Something went wrong, please try again later.'));
    }
  }
}
