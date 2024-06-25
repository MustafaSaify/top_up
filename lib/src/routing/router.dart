import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/home/di/mobile_rechange_home_factory.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/bloc/mobile_recharge_home_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/screen/mobile_recharge_home.dart';
import 'package:top_up/src/features/mobile_reacharge/success/presentation/topup_success_screen.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/di/topup_summary_factory.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/screen/topup_summary_screen.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/di/topup_factory.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/screen/topup_screen.dart';
import 'package:top_up/src/routing/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mobileRechargeHome:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<MobileRechargeHomeBloc>(
                  create: (BuildContext context) => MobileRechargeHomeFeature().initMobileRechargeHomeBloc(),
                  child: const MobileRechargeHomeScreen(),
                ));

      case topUp:
        final arguments = settings.arguments as Map<String, String>;
        final beneficiaryId = arguments["beneficiaryId"] ?? "";
        return MaterialPageRoute(
            builder: (_) => BlocProvider<TopUpBloc>(
                  create: (BuildContext context) => TopUpFeature().initTopUpBloc(),
                  child: TopUpScreen(beneficiaryId: beneficiaryId),
                ));
      
      case topUpSummaryRoute:
        final arguments = settings.arguments as Map<String, TopUpSummary>;
        final topUpSummary = arguments["topUpSummary"];
        return MaterialPageRoute(
            builder: (_) => BlocProvider<TopUpSummaryBloc>(
                  create: (BuildContext context) => TopUpSummaryFeature().initTopUpSummaryBloc(),
                  child: TopUpSummaryScreen(summary: topUpSummary!),
                ));
      
      case topUpSuccess:
        return MaterialPageRoute(
          builder: (_) => const TopUpSuccessScreen()
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
