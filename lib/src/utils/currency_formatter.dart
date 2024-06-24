import 'dart:io';
import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  String formatCurrency(num amount, String currencyCode);
}

class CurrencyFormatterImpl extends CurrencyFormatter {
  @override
  String formatCurrency(num amount, String currencyCode) {
    return '$currencyCode $amount';
  }
}
