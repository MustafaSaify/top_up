import 'package:flutter/material.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/display_model/topup_display_model.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/widgets/beneficiary_details_widget.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/widgets/topup_options_grid.dart';
import 'package:top_up/src/features/mobile_reacharge/topup/presentation/widgets/user_balance_widget.dart';
import 'package:top_up/src/shared/widgets/call_to_action_button.dart';

class TopUpForm extends StatelessWidget {
  final TopUpDisplayModel displayModel;
  final Function(num selectedAmount) onAmountSelection;
  final VoidCallback onContinuePressed;

  const TopUpForm({super.key, required this.displayModel, required this.onAmountSelection, required this.onContinuePressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            UserBalanceWidget(balance: displayModel.userBalance),
            const SizedBox(height: 20.0),
            BeneficiaryDetailsWidget(
                beneficiaryName: displayModel.benefitiaryName,
                beneficiaryPhoneNumber: displayModel.benefitiaryPhoneNumber),
            const SizedBox(height: 20.0),
            TopUpOptionsGrid(topUpOptions: displayModel.topUpOptions, onAmountSelection: onAmountSelection),
            const SizedBox(height: 20.0),
            CallToActionButton(
                label: 'Continue', isEnabled: displayModel.canInitiateTopUp, onPressed: onContinuePressed
            )
          ],
        ),
      ),
    );
  }
}
