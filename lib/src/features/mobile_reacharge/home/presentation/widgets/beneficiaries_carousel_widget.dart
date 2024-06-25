import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/widgets/beneficiary_card.dart';

class BeneficiariesCarouselWidget extends StatelessWidget {
  final List<Beneficiary> beneficiaries;
  final Function(String beneficiaryId) onRechargePressed;

  const BeneficiariesCarouselWidget({super.key, required this.beneficiaries, required this.onRechargePressed});

  @override
  Widget build(BuildContext context) {
    // Calculate the card width
    // This is to make the 3rd card partially (20%) visible.
    const double cardWidthFactor = 0.4;
    const double carouselHeight = 150;
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * cardWidthFactor;
     
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Beneficiaries',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left
        ),
        SizedBox(
          height: carouselHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: beneficiaries.length,
            itemBuilder: (context, index) {
              final beneficiary = beneficiaries[index];
              return SizedBox(
                width: cardWidth,
                child: BeneficiaryCard(beneficiary: beneficiary, onRechargePressed: onRechargePressed)
              );
            },
          ),
        ),
      ]
    );
  }
}
