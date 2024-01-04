import 'package:dio/dio.dart';

const apiKey = '795cfec4-68b1-42d6-baa0-16a53ce09a1d';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['api-key'] = apiKey;

    return super.onRequest(options, handler);
  }
}
