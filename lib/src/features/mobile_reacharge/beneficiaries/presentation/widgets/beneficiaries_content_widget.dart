import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'beneficiary_card.dart';

class BeneficiariesContentWidget extends StatelessWidget {
  final List<Beneficiary> beneficiaries;
  final Function(String beneficiaryId) onRechargePressed;

  const BeneficiariesContentWidget({super.key, required this.beneficiaries, required this.onRechargePressed});

  @override
  Widget build(Object context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: beneficiaries.length,
      itemBuilder: (context, index) {
        final beneficiary = beneficiaries[index];
        return BeneficiaryCard(beneficiary: beneficiary, onRechargePressed: onRechargePressed);
      },
    );
  }
}
