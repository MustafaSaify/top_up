import 'package:flutter/material.dart';

class BeneficiariesErrorWidget extends StatelessWidget {
  final String? message;
  const BeneficiariesErrorWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message ?? 'Something went wrong. Please try again'));
  }
}
