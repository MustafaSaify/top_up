abstract class CurrencyFormatter {
  String formatCurrency(num amount, String currencyCode);
}

class CurrencyFormatterImpl extends CurrencyFormatter {
  // TODO: Refine this logic to cater for decimal places and currency symbols.
  @override
  String formatCurrency(num amount, String currencyCode) {
    return '$currencyCode $amount';
  }
}
