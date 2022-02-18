import 'package:currency_converter/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:currency_converter/app/modules/converter/domain/usescases/convert_currency.dart';
import 'package:currency_converter/app/modules/converter/infra/repositories/currency_repository.dart';
import 'package:currency_converter/app/modules/converter/presentation/pages/about/about_page.dart';

import 'infra/datasources/currency_datasource.dart';
import 'infra/repositories/datasources/currency_datasource_interface.dart';
import 'presentation/pages/home/home_store.dart';
import 'presentation/pages/home/controllers/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/home/home_page.dart';

class ConverterModule extends Module{
   @override
  List<Bind> get binds => [
        Bind.factory<ICurrencyDatasource>(
            (i) => CurrencyDatasource(httpClient: i())),
        Bind.factory<ICurrencyRepository>(
            (i) => CurrencyRepository(currencyDatasource: i())),
        Bind.factory<IConvertCurrency>(
            (i) => ConvertCurrency(currencyRepository: i())),
        Bind.factory((i) => HomeStore()),
        Bind.factory((i) => HomeController(
              homeStore: i(),
              convertCurrency: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/about', child: (context, args) => const AboutPage()),
  ];
}