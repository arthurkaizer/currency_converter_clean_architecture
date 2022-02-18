import 'package:currency_converter/app/modules/converter/infra/repositories/models/currency_info_model.dart';

abstract class ICurrencyDatasource{
  Future<CurrencyInfoModel> getCurrencies();
}