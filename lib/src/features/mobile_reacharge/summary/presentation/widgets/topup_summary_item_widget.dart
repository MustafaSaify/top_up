import 'package:flutter/widgets.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/display_model/topup_summary_item_display_model.dart';

class TopUpSummaryItemWidget extends StatelessWidget {
  final TopUpSummaryItemDisplayModel summryItem;

  const TopUpSummaryItemWidget({super.key, required this.summryItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 44,
        child:
          Row(
            children: [
              Text(summryItem.label, style: const TextStyle(fontSize: 16)),
              const Spacer(),
              Text(summryItem.value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ]
          ),
      ),
    );
  }
}
