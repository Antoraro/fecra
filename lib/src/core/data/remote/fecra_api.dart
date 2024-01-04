import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../feature/currency_rates/data/models/currency_rates_dto.dart';
import '../../../feature/currency_rates/data/remote/currency_rates_api.dart';

part 'fecra_api.g.dart';

const baseUrl = 'https://sample-comments-service-5y6owysdhq-uc.a.run.app';

@RestApi(baseUrl: baseUrl)
abstract class FecraApi implements CurrencyRatesApi {
  factory FecraApi(Dio dio, {String baseUrl}) = _FecraApi;

  @override
  @GET('/fx/current')
  Future<CurrencyRatesDTO> getCurrencyRates();
}
