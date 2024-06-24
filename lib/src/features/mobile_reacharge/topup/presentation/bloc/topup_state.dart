import 'package:equatable/equatable.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_display_model.dart';

abstract class TopUpState extends Equatable {
  const TopUpState();
}

class InitialState extends TopUpState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TopUpState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends TopUpState {
  final TopUpDisplayModel payload;

  const LoadedState({required this.payload});

  @override
  List<Object?> get props => [payload];
}

class PageLoadErrorState extends TopUpState {
  @override
  List<Object?> get props => [];
}

class InitiatingTopUpState extends TopUpState {
  @override
  List<Object?> get props => [];
}

class TopUpInitiatedState extends TopUpState {
  final TopUpSummary topUpSummary;

  const TopUpInitiatedState({required this.topUpSummary});

  @override
  List<Object?> get props => [topUpSummary];
}

class InitiateTopUpErrorState extends TopUpState {
  final String message;

  const InitiateTopUpErrorState({required this.message});
  
  @override
  List<Object?> get props => [message];
}