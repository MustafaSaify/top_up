import 'package:flutter/material.dart';

class BeneficiariesLoadingWidget extends StatelessWidget {
  const BeneficiariesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
