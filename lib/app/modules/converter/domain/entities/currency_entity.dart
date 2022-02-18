import 'dart:async';

import 'package:intl/intl.dart';

class CurrencyEntity{
  final double dolar;
  final double euro;
  final double real;

  String _format(double value){
    final formatter = NumberFormat.currency(symbol: '');
    return formatter.format(value);
  }

  String get realFormatter => _format(real);
  String get dolarFormatter => _format(dolar);
  String get euroFormatter => _format(euro);
  

  CurrencyEntity({required this.real, required this.dolar, required this.euro});
}