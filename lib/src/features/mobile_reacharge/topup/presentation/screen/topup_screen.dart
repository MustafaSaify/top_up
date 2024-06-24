import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_event.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/bloc/topup_state.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_display_model.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/widgets/topup_form.dart';
import 'package:top_up/src/routing/routes.dart';

class TopUpScreen extends StatefulWidget {
  final String beneficiaryId;

  const TopUpScreen({super.key, required this.beneficiaryId});

  @override
  State<StatefulWidget> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  late TopUpBloc _topUpBloc;

  @override
  void initState() {
    super.initState();
    _topUpBloc = BlocProvider.of<TopUpBloc>(context);
    _topUpBloc.add(PageLoadEvent(beneficiaryId: widget.beneficiaryId));
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<TopUpBloc, TopUpState>(
      key: const Key("top_up"),
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      listener: (context, state) => _onStateChangeListener(state),
      builder: (context, state) => _onStateChangeBuilder(state));

  bool _buildWhen(
    TopUpState previous,
    TopUpState current,
  ) {
    return current is LoadingState ||
        current is LoadedState ||
        current is PageLoadErrorState ||
        current is InitialState;
  }

  bool _listenWhen(
    TopUpState previous,
    TopUpState current,
  ) {
    return current is InitiatingTopUpState ||
        current is TopUpInitiatedState ||
        current is InitiateTopUpErrorState;
  }

  void _onStateChangeListener(TopUpState state) {
    if (state is TopUpInitiatedState) {
      _navigateToTopUpSummaryScreen(state.topUpSummary);
    }
  }

  Widget _onStateChangeBuilder(TopUpState state) {
    Widget body;
    if (state is LoadingState) {
      body = _buildLoadingWidget();
    } else if (state is LoadedState) {
      body = _buildContentWidget(state.payload);
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

  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildContentWidget(TopUpDisplayModel displayModel) {
    return TopUpForm(
      displayModel: displayModel,
      onAmountSelection: (selectedAmount) {
        _topUpBloc.add(SelectAmountEvent(amount: selectedAmount));
      },
      onContinuePressed: () {
        print('onContinueButton pressed');
        _topUpBloc.add(ContinueTopUpEvent());
      },
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
        child: Text(
      'Something went wrong, please try again later.',
      style: TextStyle(fontSize: 16),
    ));
  }

  void _navigateToTopUpSummaryScreen(TopUpSummary topUpSummary) {
    Navigator.pushNamed(
      context,
      topUpSummaryRoute,
      arguments: {"topUpSummary": topUpSummary});
  }
}
