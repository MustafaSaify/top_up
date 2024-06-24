import 'package:flutter/material.dart';

class BeneficiariesErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback onReloadPress;
  
  const BeneficiariesErrorWidget({super.key, this.message, required this.onReloadPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Something went wrong. Please try again'),
          OutlinedButton(
            onPressed: onReloadPress, 
            child: const Text('Reload')
          )
        ]
      )
    );
  }
}
