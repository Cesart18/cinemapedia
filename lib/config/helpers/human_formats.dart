import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formatedNumber = NumberFormat.compactCurrency(
      decimalDigits: 1,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formatedNumber;
  }
  static String shortDate(DateTime date){
    final format = DateFormat.yMMMEd('es');
    return format.format(date);

  }
}
