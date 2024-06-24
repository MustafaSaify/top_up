import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_option_display_model.dart';

class TopUpOptionTile extends StatelessWidget {
  final TopUpOptionDisplayModel topUpOption;
  final Function(num selectedAmount) onPress;

  const TopUpOptionTile({super.key, required this.topUpOption, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        topUpOption.isEnabled ? onPress(topUpOption.amount) : null;
      },
      child: Card(
        elevation: 0,
        color: _getTileColor(context),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Text(topUpOption.formattedAmount,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: _getLabelColor())
              )
            )
          )
      ),
    );
  }

  Color _getTileColor(BuildContext context) {
    if (topUpOption.isSelected) {
      return Theme.of(context).primaryColor;
    }
    return Colors.white.withOpacity(topUpOption.isEnabled ? 1.0 : 0.6);
  }

  Color _getLabelColor() {
    if (topUpOption.isSelected) {
      return Colors.white;
    }
    return Colors.black.withOpacity(topUpOption.isEnabled ? 1.0 : 0.2);
  }
}
