import 'package:flutter/material.dart';
import 'package:top_up/src/shared/widgets/call_to_action_button.dart';

class TopUpSuccessScreen extends StatelessWidget {

  const TopUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("topup_success_screen"),
      appBar: AppBar(
        title: const Text('Top Up Success'),
        automaticallyImplyLeading: false
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48,
              ),
              const SizedBox(height: 10),
              const Text('The phone number has been topped up successfully', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 40),
              CallToActionButton(label: 'Done', isEnabled: true, onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              })
            ],
          )
        ),
      )
    );
  }
}