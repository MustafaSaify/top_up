import 'package:equatable/equatable.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';

abstract class BeneficiariesState extends Equatable {
  const BeneficiariesState();
}

class InitialState extends BeneficiariesState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends BeneficiariesState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends BeneficiariesState {
  final List<Beneficiary> payload;

  const LoadedState({required this.payload});

  @override
  List<Object?> get props => [payload];
}

class ErrorState extends BeneficiariesState {
  final String error;

  const ErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
