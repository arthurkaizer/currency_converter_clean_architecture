import 'package:currency_converter/app/modules/converter/domain/entities/currency_info_entity.dart';
import 'package:currency_converter/app/modules/converter/domain/enums/currency_type_enum.dart';
import 'package:currency_converter/app/modules/converter/domain/errors/errors.dart';
import 'package:currency_converter/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:currency_converter/app/modules/converter/domain/usescases/convert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'convert_currency_test.mocks.dart';

@GenerateMocks([ICurrencyRepository])
void main() {
  late ConvertCurrency _usecase;
  final _currencyRepository = MockICurrencyRepository();

  setUp(() {
    _usecase = ConvertCurrency(currencyRepository: _currencyRepository);
  });

  group('Teste de dolares', () {
    test(
        '''
    Dado o valor de 4 dolares
    Quando retornar a cotação do dolar de 6 reais e euro 8 reais
    Então deve calcular 24 reais, 3 euros e 4 dolares
  ''',
        () async {
      //arrange
      const value = '4';
      const type = CurrencyTypeEnum.usd;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 6, euro: 8),
      );

      //act
      final result = await _usecase(value, type);

      //assert
      expect(result.real, 24);
      expect(result.dolar, 4);
      expect(result.euro, 3);
      verify(_currencyRepository.getCurrencies()).called(1);
    });
  });
  group('Teste de euro', () {
    test(
        '''
    Dado o valor de 4 euros
    Quando retornar a cotação do dolar de 2 reais e euro 4 reais
    Então deve calcular 16 reais, 4 euros e 8 dolares
  ''',
        () async {
      //arrange
      const value = '4';
      const type = CurrencyTypeEnum.eur;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 2, euro: 4),
      );

      //act
      final result = await _usecase(value, type);

      //assert
      expect(result.real, 16);
      expect(result.dolar, 8);
      expect(result.euro, 4);
      verify(_currencyRepository.getCurrencies()).called(1);
    });
  });
  group('Teste de Reais', () {
    test(
        '''
    Dado o valor de 100 reais
    Quando retornar a cotação do dolar de 5 reais e euro 10 reais
    Então deve calcular 100 reais, 10 euros e 20 dolares
  ''',
        () async {
      //arrange
      const value = '100';
      const type = CurrencyTypeEnum.brl;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 5, euro: 10),
      );

      //act
      final result = await _usecase(value, type);

      //assert
      expect(result.real, 100);
      expect(result.dolar, 20);
      expect(result.euro, 10);
      verify(_currencyRepository.getCurrencies()).called(1);
    });
  });
  group('Teste de exceções', () {
    test(
        '''
    Dado um valor em reais
    Quando o valor for vazio
    Então deve disparar uma exceção
  ''',
        () async {
      //arrange
      const value = '';
      const type = CurrencyTypeEnum.brl;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 5, euro: 10),
      );

      //act
      final result =  _usecase(value, type);

      //assert
      expect(result, throwsA(isA<ValueIsEmptyError>()));
      verifyNever(_currencyRepository.getCurrencies());
    });

    test(
        '''
    Dado um valor em reais
    Quando o valor não for um número
    Então deve disparar uma exceção
  ''',
        () async {
      //arrange
      const value = 'a';
      const type = CurrencyTypeEnum.brl;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 5, euro: 10),
      );

      //act
      final result =  _usecase(value, type);

      //assert
      expect(result, throwsA(isA<ValueNotNumberError>()));
      verifyNever(_currencyRepository.getCurrencies());
    });

    test(
        '''
    Dado um valor em reais
    Quando o valor for negativo
    Então deve disparar uma exceção
  ''',
        () async {
      //arrange
      const value = '-10';
      const type = CurrencyTypeEnum.brl;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 5, euro: 10),
      );

      //act
      final result =  _usecase(value, type);

      //assert
      expect(result, throwsA(isA<ValueNegativeError>()));
      verifyNever(_currencyRepository.getCurrencies());
    });
  });
}
