import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/di/beneficiaries_factory.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/pages/mobile_recharge_home.dart';
import 'package:top_up/src/routing/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<BeneficiariesBloc>(
                  create: (BuildContext context) =>
                      BeneficiariesFeature().initBeneficiariesBloc(),
                  child: const MobileRechargeHomePage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
