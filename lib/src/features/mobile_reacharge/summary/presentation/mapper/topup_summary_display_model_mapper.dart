import 'package:top_up/src/features/mobile_reacharge/summary/domain/entity/topup_summary.dart';
import 'package:top_up/src/features/mobile_reacharge/summary/presentation/display_model/topup_summary_item_display_model.dart';
import 'package:top_up/src/utils/currency_formatter.dart';

abstract class TopUpSummaryDisplayModelMapper {
  List<TopUpSummaryItemDisplayModel> map(TopUpSummary summary);
}

class TopUpSummaryDisplayModelMapperImpl extends TopUpSummaryDisplayModelMapper {
  final CurrencyFormatter currencyFormatter;

  TopUpSummaryDisplayModelMapperImpl({required this.currencyFormatter});
  
  @override
  List<TopUpSummaryItemDisplayModel> map(TopUpSummary summary) {
    final transactionIdSummaryItem = TopUpSummaryItemDisplayModel(
      label: 'Transaction Id',
      value: summary.transactionId
    );

    final beneficiaryNameSummaryItem = TopUpSummaryItemDisplayModel(
      label: 'Beneficiary Name',
      value: summary.beneficiaryName
    );

    final beneficiaryPhoneNumberSummaryItem = TopUpSummaryItemDisplayModel(
      label: 'Beneficiary Phone no.',
      value: summary.beneficiaryPhoneNumber
    );

    final topUpAmountSummaryItem = TopUpSummaryItemDisplayModel(
      label: 'TopUp Amount',
      value: currencyFormatter.formatCurrency(summary.topUpAmount, summary.currencyCode)
    );

    final serviceChargeSummaryItem = TopUpSummaryItemDisplayModel(
      label: 'Service Charge',
      value: currencyFormatter.formatCurrency(summary.serviceCharge, summary.currencyCode)
    );

    final totalAmountSummaryItem = TopUpSummaryItemDisplayModel(
      label: 'Total Amount',
      value: currencyFormatter.formatCurrency(summary.totalAmount, summary.currencyCode)
    );

    return [
      transactionIdSummaryItem,
      beneficiaryNameSummaryItem,
      beneficiaryPhoneNumberSummaryItem,
      topUpAmountSummaryItem,
      serviceChargeSummaryItem,
      totalAmountSummaryItem
    ];
  }

}