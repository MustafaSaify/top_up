import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/repository/beneficiaries_repository.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/bloc/mobile_recharge_home_event.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/bloc/mobile_recharge_home_state.dart';

class MobileRechargeHomeBloc extends Bloc<MobileRechargeHomeEvent, MobileRechargeHomeState> {
  
  final BeneficiariesRepository beneficiariesRepository;

  MobileRechargeHomeBloc(this.beneficiariesRepository)
    : super(const InitialState()) {
    on<PageLoadEvent>(_handlePageLoadEvent);
  }

  Future<void> _handlePageLoadEvent(
    PageLoadEvent event,
    Emitter<MobileRechargeHomeState> emit,
  ) async {
    emit(const LoadingState());
    try{
      final beneficiaries = await beneficiariesRepository.getBeneficiaries();
      emit(LoadedState(beneficiaries: beneficiaries));
    }
    catch(e) {
      emit(const ErrorState(message: 'Something went wrong. Please try again'));
    }
  }
}
