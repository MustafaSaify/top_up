import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/entity/topup_data.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/usecase/calculate_max_possible_topup_amount_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/usecase/get_topup_data_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/domain/usecase/initiate_topup_usecase.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_event.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_state.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/mapper/topup_display_model_mapper.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  final GetTopUpDataUseCase getTopUpDataUseCase;
  final CalculateMaxPossibleTopUpAmountUsecase
      calculateMaxPossibleTopUpAmountUsecase;
  final InitiateTopUpUseCase initiateTopUpUseCase;
  final TopUpDisplayModelMapper displayModelMapper;

  // States
  late num _selectedAmount = 0;
  late num _maxPossibleTopUpAmount;
  late TopUpData _topUpData;

  TopUpBloc(
      this.getTopUpDataUseCase,
      this.calculateMaxPossibleTopUpAmountUsecase,
      this.initiateTopUpUseCase,
      this.displayModelMapper)
      : super(InitialState()) {
    on<PageLoadEvent>(_handlePageLoadEvent);
    on<SelectAmountEvent>(_handleAmountSelectionEvent);
    on<ContinueTopUpEvent>(_initiateTopUp);
  }

  Future<void> _handlePageLoadEvent(
    PageLoadEvent event,
    Emitter<TopUpState> emit,
  ) async {
    emit(LoadingState());
    try {
      _topUpData = await getTopUpDataUseCase(event.beneficiaryId);

      _maxPossibleTopUpAmount = calculateMaxPossibleTopUpAmountUsecase(
          userInfo: _topUpData.userInfo,
          beneficiaryMonthlyTotal:
              _topUpData.beneficiaryDetails.topUpDetails.monthlyTotalAmount,
          topUpConfig: _topUpData.topUpConfig);

      final displayModel = displayModelMapper.map(
          _topUpData.userInfo,
          _topUpData.beneficiaryDetails,
          _topUpData.topUpOptions,
          _selectedAmount,
          _maxPossibleTopUpAmount);

      emit(LoadedState(payload: displayModel));
    } catch (e) {
      emit(PageLoadErrorState());
    }
  }

  Future<void> _handleAmountSelectionEvent(
    SelectAmountEvent event,
    Emitter<TopUpState> emit,
  ) async {
    _selectedAmount = event.amount;
    final displayModel = displayModelMapper.map(
        _topUpData.userInfo,
        _topUpData.beneficiaryDetails,
        _topUpData.topUpOptions,
        _selectedAmount,
        _maxPossibleTopUpAmount);
    emit(LoadedState(payload: displayModel));
  }

  Future<void> _initiateTopUp(
    ContinueTopUpEvent event,
    Emitter<TopUpState> emit,
  ) async {
    emit(InitiatingTopUpState());
    print('Initiating topup...');
    try {
      final topUpSummary = await initiateTopUpUseCase(
          _topUpData.beneficiaryDetails.id, _selectedAmount);
      print('topup summary: $topUpSummary');
      emit(TopUpInitiatedState(topUpSummary: topUpSummary));
    } catch (e) {
      emit(const InitiateTopUpErrorState(message: 'Initiate TopUp failed. Please try again'));
    }
  }
}
