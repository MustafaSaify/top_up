import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/widgets/beneficiaries_widget.dart';

class MobileRechargeHomePage extends StatelessWidget {
  const MobileRechargeHomePage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Recharge'),
        ),
        body: const Column(
            children: [SizedBox(height: 16), BeneficiariesWidget()]));
  }
}
