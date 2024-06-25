import 'package:equatable/equatable.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';

abstract class MobileRechargeHomeState extends Equatable {
  const MobileRechargeHomeState();
}

class InitialState extends MobileRechargeHomeState {
  const InitialState();
  @override
  List<Object?> get props => [];
}

class LoadingState extends MobileRechargeHomeState {
  const LoadingState();
  @override
  List<Object?> get props => [];
}

class LoadedState extends MobileRechargeHomeState {
  final List<Beneficiary> beneficiaries;
  const LoadedState({required this.beneficiaries});
  @override
  List<Object?> get props => [beneficiaries];
}

class ErrorState extends MobileRechargeHomeState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}