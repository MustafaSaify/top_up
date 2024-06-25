import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_event.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/bloc/topup_summary_state.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/display_model/topup_summary_item_display_model.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/widgets/topup_summary_content_widget.dart';
import 'package:top_up/src/routing/routes.dart';

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
  Widget build(BuildContext context) =>
      BlocConsumer<TopUpSummaryBloc, TopUpSummaryState>(
          key: const Key("top_up_summary"),
          buildWhen: _buildWhen,
          listenWhen: _listenWhen,
          listener: (context, state) => _onStateChangeListener(state),
          builder: (context, state) => _onStateChangeBuilder(state));

  bool _buildWhen(
    TopUpSummaryState previous,
    TopUpSummaryState current,
  ) {
    return current is LoadedState || current is InitialState;
  }

  bool _listenWhen(
    TopUpSummaryState previous,
    TopUpSummaryState current,
  ) {
    return current is CompletingTopUpState ||
        current is TopUpSuccessState ||
        current is TopUpFailedState;
  }

  void _onStateChangeListener(TopUpSummaryState state) {
    if (state is TopUpSuccessState) {
      _navigateToTopUpSuccessScreen();
    }
  }

  Widget _onStateChangeBuilder(TopUpSummaryState state) {
    Widget body;
    if (state is LoadedState) {
      body = _buildContentWidget(state.summaryItems);
    } else {
      body = _buildErrorWidget();
    }
    return Scaffold(
        key: const Key("topup_screen"),
        appBar: AppBar(
          title: const Text('Top Up'),
        ),
        body: body);
  }

  Widget _buildContentWidget(List<TopUpSummaryItemDisplayModel> summaryItems) {
    return TopUpSummaryContentWidget(
        summaryItems: summaryItems,
        onCompleteTopUpPressed: () {
          _topUpSummaryBloc
              .add(CompleteTopUpEvent(widget.summary.transactionId));
        });
  }

  Widget _buildErrorWidget() {
    return const Center(
        child: Text(
      'Something went wrong, please try again later.',
      style: TextStyle(fontSize: 16),
    ));
  }

  void _navigateToTopUpSuccessScreen() {
    Navigator.pushNamed(context, topUpSuccess);
  }
}
