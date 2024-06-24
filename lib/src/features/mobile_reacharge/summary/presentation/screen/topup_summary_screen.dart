import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_event.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_state.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/widgets/topup_summary_content_widget.dart';

class TopUpSummaryScreen extends StatefulWidget {
  final TopUpSummary summary;

  const TopUpSummaryScreen({super.key, required this.summary});

  @override
  State<StatefulWidget> createState() => _TopUpSummaryScreenState();
}

class _TopUpSummaryScreenState extends State<TopUpSummaryScreen> {
  late TopUpSummaryBloc _topUpSummaryBloc;

  @override
  void initState() {
    super.initState();
    _topUpSummaryBloc = BlocProvider.of<TopUpSummaryBloc>(context);
    _topUpSummaryBloc.add(PageLoadEvent(summary: widget.summary));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("topup_screen"),
      appBar: AppBar(
        title: const Text('Top Up Summary'),
      ),
      body: BlocBuilder<TopUpSummaryBloc, TopUpSummaryState>(builder: (context, state) {
        if (state is LoadedState) {
          return TopUpSummaryContentWidget(summaryItems: state.summaryItems, onCompleteTopUpPressed: () {
            _topUpSummaryBloc.add(CompleteTopUpEvent(widget.summary.transactionId));
          });
        } else {
          return const Text('Placeholder');
        }
      }),
    );
  }
}
