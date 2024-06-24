import 'package:flutter/material.dart';

class UserBalanceWidget extends StatelessWidget {
  final String balance;

  const UserBalanceWidget({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 6.0, vertical: 14.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                const Text('Wallet Balance', style: TextStyle(fontSize: 16)),
                const Spacer(),
                Text(balance, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ],
            )
          )
        ),
      ],
    );
  }
}
