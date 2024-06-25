import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/widgets/beneficiary_card.dart';

class BeneficiariesCarouselWidget extends StatelessWidget {
  final List<Beneficiary> beneficiaries;
  final Function(String beneficiaryId) onRechargePressed;

  const BeneficiariesCarouselWidget({super.key, required this.beneficiaries, required this.onRechargePressed});

  @override
  Widget build(Object context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Beneficiaries',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: beneficiaries.length,
            itemBuilder: (context, index) {
              final beneficiary = beneficiaries[index];
              return BeneficiaryCard(beneficiary: beneficiary, onRechargePressed: onRechargePressed);
            },
          ),
        ),
      ]
    );
  }
}
