import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/repository/beneficiaries_repository.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_event.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_state.dart';

class BeneficiariesBloc extends Bloc<BeneficiariesEvent, BeneficiariesState> {
  BeneficiariesRepository beneficiariesRepository;

  BeneficiariesBloc({required this.beneficiariesRepository})
      : super(InitialState()) {
    on<LoadBeneficiariesEvent>(_handleLoadBeneficiariesEvent);
  }

  Future<void> _handleLoadBeneficiariesEvent(
    LoadBeneficiariesEvent event,
    Emitter<BeneficiariesState> emit,
  ) async {
    emit(LoadingState());
    try {
      var beneficiaries = await beneficiariesRepository.getBeneficiaries();
      emit(LoadedState(payload: beneficiaries));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
