import 'package:equatable/equatable.dart';

abstract class TopUpEvent extends Equatable {
  const TopUpEvent();
}

class PageLoadEvent extends TopUpEvent {
  final String beneficiaryId;

  const PageLoadEvent({required this.beneficiaryId});

  @override
  List<Object?> get props => [beneficiaryId];
}

class SelectAmountEvent extends TopUpEvent {
  final num amount;

  const SelectAmountEvent({required this.amount});

  @override
  List<Object?> get props => [amount];
}

class ContinueTopUpEvent extends TopUpEvent {
  @override
  List<Object?> get props => [];
}
