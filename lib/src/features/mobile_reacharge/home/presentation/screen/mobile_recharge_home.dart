import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/bloc/mobile_recharge_home_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/bloc/mobile_recharge_home_event.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/bloc/mobile_recharge_home_state.dart';
import 'package:top_up/src/features/mobile_reacharge/home/presentation/widgets/beneficiaries_carousel_widget.dart';
import 'package:top_up/src/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileRechargeHomeScreen extends StatefulWidget {
  const MobileRechargeHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MobileRechargeHomeScreenState();
}

class _MobileRechargeHomeScreenState extends State<MobileRechargeHomeScreen> {
  late MobileRechargeHomeBloc _mobileRechargeHomeBloc;

  @override
  void initState() {
    super.initState();
    _mobileRechargeHomeBloc = BlocProvider.of<MobileRechargeHomeBloc>(context);
    _loadData();
  }

  void _loadData() {
    _mobileRechargeHomeBloc.add(const PageLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Recharge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MobileRechargeHomeBloc, MobileRechargeHomeState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return _buildLoadingWidget();
            } else if (state is LoadedState) {
              return _buildContentWidget(state.beneficiaries);
            } else if (state is ErrorState) {
              return _buildErrorWidget();
            } else {
              return _buildErrorWidget();
            }
          },
        )
      )
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildContentWidget(List<Beneficiary> beneficiaries) {
    return Column(
      children: [
        const SizedBox(height: 16),
        BeneficiariesCarouselWidget(beneficiaries: beneficiaries, onRechargePressed: (beneficiaryId) {
          _navigateToTopUpScreen(context, beneficiaryId);
        })
      ]
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
      child: Text('Something went wrong, please try again.', style: TextStyle(fontSize: 16))
    );
  }

  void _navigateToTopUpScreen(BuildContext context, String beneficiaryId) {
    Navigator.pushNamed(
      context,
      topUp,
      arguments: {"beneficiaryId" : beneficiaryId}
    );
  }
}
