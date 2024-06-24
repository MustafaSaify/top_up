import 'package:flutter/material.dart';

class CallToActionButton extends StatelessWidget {
  final String label;
  final bool isEnabled;
  final VoidCallback onPressed;

  const CallToActionButton({super.key, required this.label, required this.isEnabled, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Theme.of(context).primaryColor.withOpacity(.4), // Background Color
                  disabledForegroundColor: Colors.white70,
                  foregroundColor: Colors.white,//Text Color
                  backgroundColor: Theme.of(context).primaryColor
              ),
              onPressed: isEnabled ? onPressed : null,
              child: Text(label, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}