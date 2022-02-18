import 'package:currency_converter/app/modules/converter/domain/entities/currency_info_entity.dart';

abstract class ICurrencyRepository{
  Future <CurrencyInfoEntity> getCurrencies();
}