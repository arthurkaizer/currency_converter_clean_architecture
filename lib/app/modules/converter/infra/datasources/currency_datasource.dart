import 'package:currency_converter/app/modules/converter/infra/repositories/models/currency_info_model.dart';
import '../repositories/datasources/currency_datasource_interface.dart';
import '../../../../../commons/adapters/http_client/http_client_adapter.dart';

class CurrencyDatasource extends ICurrencyDatasource {
  final IHttpClientAdapter _httpClient;

  CurrencyDatasource({required httpClient}):_httpClient = httpClient;
  @override
  Future<CurrencyInfoModel> getCurrencies() async {
      final respose = await _httpClient.get('/finance', queryParameters: {
        'format': 'json',
      });
      var result = CurrencyInfoModel.fromJson(respose.data);
      return result;
  }
}
