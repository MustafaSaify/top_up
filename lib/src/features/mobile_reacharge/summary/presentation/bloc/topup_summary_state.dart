
import 'package:equatable/equatable.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/display_model/topup_summary_item_display_model.dart';

abstract class TopUpSummaryState extends Equatable {
  const TopUpSummaryState();
}

class InitialState extends TopUpSummaryState {
  const InitialState();
  @override
  List<Object?> get props => [];
}

class LoadedState extends TopUpSummaryState {
  final List<TopUpSummaryItemDisplayModel> summaryItems;

  const LoadedState({required this.summaryItems});

  @override
  List<Object?> get props => [summaryItems];
}

class CompletingTopUpState extends TopUpSummaryState {
  @override
  List<Object?> get props => [];
}

class TopUpSuccessState extends TopUpSummaryState {
  @override
  List<Object?> get props => [];
}

class TopUpFailedState extends TopUpSummaryState {
  final String message;

  const TopUpFailedState({required this.message});

  @override
  List<Object?> get props => [];
}
