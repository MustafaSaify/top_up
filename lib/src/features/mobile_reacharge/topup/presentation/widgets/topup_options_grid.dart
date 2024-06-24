import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_option_display_model.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/widgets/topup_option_tile.dart';

class TopUpOptionsGrid extends StatelessWidget {
  final List<TopUpOptionDisplayModel> topUpOptions;
  final Function(num selectedAmount) onAmountSelection;

  const TopUpOptionsGrid({super.key, required this.topUpOptions, required this.onAmountSelection});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Select Amount',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, i) =>
            TopUpOptionTile(topUpOption: topUpOptions[i], onPress: onAmountSelection,),
        itemCount: topUpOptions.length,
      ),
    ]);
  }
}
