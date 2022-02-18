import 'package:currency_converter/app/modules/converter/domain/entities/currency_info_entity.dart';
import 'package:currency_converter/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:currency_converter/app/modules/converter/infra/repositories/models/currency_info_model.dart';

import 'datasources/currency_datasource_interface.dart';

class CurrencyRepository extends ICurrencyRepository{
  final ICurrencyDatasource _currencyDatasource;

  CurrencyRepository({required ICurrencyDatasource currencyDatasource}):_currencyDatasource = currencyDatasource; 

  @override
  Future<CurrencyInfoEntity> getCurrencies() async {
    final result = await _currencyDatasource.getCurrencies();

    return result;
  }

}