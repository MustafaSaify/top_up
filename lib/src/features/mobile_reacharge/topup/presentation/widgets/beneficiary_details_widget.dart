import 'package:flutter/material.dart';

class BeneficiaryDetailsWidget extends StatelessWidget {
  final String beneficiaryName;
  final String beneficiaryPhoneNumber;

  const BeneficiaryDetailsWidget({super.key, required this.beneficiaryName, required this.beneficiaryPhoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Beneficiary', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 14.0),//EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Row(
                  children: [
                    Text(beneficiaryName, style: const TextStyle(fontSize: 16)),
                    const Spacer(),
                    Text(beneficiaryPhoneNumber, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                )
              )
            ),
          ],
        ),
      ],
    );
  }
}