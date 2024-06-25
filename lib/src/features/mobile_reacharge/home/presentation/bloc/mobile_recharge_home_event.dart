import 'package:equatable/equatable.dart';

abstract class MobileRechargeHomeEvent extends Equatable {
  const MobileRechargeHomeEvent();
}

class PageLoadEvent extends MobileRechargeHomeEvent {
  const PageLoadEvent();

  @override
  List<Object?> get props => [];
}
