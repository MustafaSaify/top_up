import 'package:equatable/equatable.dart';

abstract class BeneficiariesEvent extends Equatable {
  const BeneficiariesEvent();
}

class LoadBeneficiariesEvent extends BeneficiariesEvent {
  @override
  List<Object?> get props => [];
}
