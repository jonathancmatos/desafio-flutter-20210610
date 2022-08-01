import 'package:intl/intl.dart';


extension DateTimeExtension on DateTime{
  String formattedDateTime(){
    return DateFormat("dd/MM/yyyy HH:mm", "pt-BR").format(this);
  }

  String formattedDate(){
    return DateFormat("dd/MM/yyyy", "pt-BR").format(this);
  }
}

extension CurrencyValue on String{
  String getCurrency(){
    return NumberFormat.simpleCurrency(locale: "pt_BR").format(double.parse(this));
  }
}