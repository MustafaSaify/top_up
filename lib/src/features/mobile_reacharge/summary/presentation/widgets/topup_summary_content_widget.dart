import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/display_model/topup_summary_item_display_model.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/widgets/topup_summary_item_widget.dart';
import 'package:top_up/src/shared/widgets/call_to_action_button.dart';

class TopUpSummaryContentWidget extends StatelessWidget {
  final List<TopUpSummaryItemDisplayModel> summaryItems;
  final VoidCallback onCompleteTopUpPressed;

  const TopUpSummaryContentWidget({super.key, required this.summaryItems, required this.onCompleteTopUpPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: summaryItems.length,
              itemBuilder: (context, index) {
                final summaryItem = summaryItems[index];
                return TopUpSummaryItemWidget(summryItem: summaryItem);
              },
              separatorBuilder: (context, index) {
                return const Divider(indent: 8.0);
              },
            ),
            CallToActionButton(label: 'Complete Top Up', isEnabled: true, onPressed: onCompleteTopUpPressed)
          ]
        ),
      ),
    );
  }
}
