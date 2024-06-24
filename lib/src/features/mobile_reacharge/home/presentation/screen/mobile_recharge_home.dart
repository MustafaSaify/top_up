import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/widgets/beneficiaries_widget.dart';
import 'package:top_up/src/routing/routes.dart';

class MobileRechargeHomeScreen extends StatelessWidget {
  const MobileRechargeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Recharge'),
        ),
        body: Column(children: [
          const SizedBox(height: 16),
          BeneficiariesWidget(onRechargePressed: (beneficiaryId) {
            _navigateToTopUpScreen(context, beneficiaryId);
          })
        ]));
  }

  void _navigateToTopUpScreen(BuildContext context, String beneficiaryId) {
    Navigator.pushNamed(
      context,
      topUp,
      arguments: {"beneficiaryId" : beneficiaryId}
    );
  }
}
