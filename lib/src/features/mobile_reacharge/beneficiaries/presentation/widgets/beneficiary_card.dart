import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';

class BeneficiaryCard extends StatelessWidget {
  final Beneficiary beneficiary;

  const BeneficiaryCard({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(beneficiary.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          const SizedBox(height: 6),
          Text(beneficiary.phoneNumber,
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 6),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: const Text('Recharge Now'),
          )
        ],
      ),
    ));
  }
}
