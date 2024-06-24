import 'package:equatable/equatable.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';

abstract class TopUpSummaryEvent extends Equatable {
  const TopUpSummaryEvent();
}

class PageLoadEvent extends TopUpSummaryEvent {
  final TopUpSummary summary;

  const PageLoadEvent({required this.summary});

  @override
  List<Object?> get props => [summary];
}

class CompleteTopUpEvent extends TopUpSummaryEvent {
  final String transactionId;

  const CompleteTopUpEvent(this.transactionId);

  @override
  List<Object?> get props => [transactionId];
}
