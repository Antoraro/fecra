import 'package:dio/dio.dart' hide Response;

import '../../domain/errors.dart';
import '../response.dart';

mixin RemoteDatastore {
  Future<Response<T>> getFromRemoteSource<T>(
      Future<T> Function() loadRemoteData) async {
    Response<T> response;
    try {
      response = ResponseSuccess(await loadRemoteData());
    } on DioException catch (e) {
      return ResponseError(error: ConnectionError(), errorText: e.message);
    } catch (e) {
      return ResponseError();
    }
    return response;
  }
}
