import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_bloc.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_event.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/bloc/beneficiaries_state.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/widgets/beneficiaries_content_widget.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/widgets/beneficiaries_error_widget.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/presentation/widgets/beneficiaries_loading_widget.dart';

class BeneficiariesWidget extends StatefulWidget {
  final Function(String beneficiaryId) onRechargePressed;
  const BeneficiariesWidget({super.key, required this.onRechargePressed});

  @override
  State<StatefulWidget> createState() => _BeneficiariesWidgetState();
}

class _BeneficiariesWidgetState extends State<BeneficiariesWidget> {
  late BeneficiariesBloc _beneficiariesBloc;

  @override
  void initState() {
    super.initState();
    _beneficiariesBloc = BlocProvider.of<BeneficiariesBloc>(context);
    _loadBeneficiaries();
  }

  void _loadBeneficiaries() {
    _beneficiariesBloc.add(LoadBeneficiariesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Beneficiaries',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.left
          ),
          SizedBox(
            height: 150,
            child: BlocBuilder<BeneficiariesBloc, BeneficiariesState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const BeneficiariesLoadingWidget();
                } else if (state is LoadedState) {
                  return BeneficiariesContentWidget(beneficiaries: state.payload, onRechargePressed: widget.onRechargePressed);
                } else if (state is ErrorState) {
                  return BeneficiariesErrorWidget(message: state.error, onReloadPress: _loadBeneficiaries);
                } else {
                  return BeneficiariesErrorWidget(onReloadPress: _loadBeneficiaries);
                }
              },
            )
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //       create: (context) => _beneficiariesBloc,
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 12.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const Text('Beneficiaries',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //               textAlign: TextAlign.left
  //             ),
  //             SizedBox(
  //               height: 150,
  //               child: BlocBuilder<BeneficiariesBloc, BeneficiariesState>(
  //                 builder: (context, state) {
  //                   if (state is LoadingState) {
  //                     return const BeneficiariesLoadingWidget();
  //                   } else if (state is LoadedState) {
  //                     return BeneficiariesContentWidget(beneficiaries: state.payload, onRechargePressed: widget.onRechargePressed);
  //                   } else if (state is ErrorState) {
  //                     return BeneficiariesErrorWidget(message: state.error, onReloadPress: _loadBeneficiaries);
  //                   } else {
  //                     return BeneficiariesErrorWidget(onReloadPress: _loadBeneficiaries);
  //                   }
  //                 },
  //               )
  //             )
  //           ],
  //         ),
  //       )
  //     );
  // }
}
