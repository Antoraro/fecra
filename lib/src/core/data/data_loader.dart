import '../domain/errors.dart';
import 'data_wrapper.dart';

mixin DataLoader<T> {
  Future<T> dataSingle(Future<DataWrapper<T>> Function() loadData) async {
    final wrapper = await loadData();
    if (wrapper is DataWrapperHasData) {
      final hasData = wrapper as DataWrapperHasData<T>;
      return hasData.data;
    } else if (wrapper is DataWrapperError) {
      return Future<T>.error((wrapper as DataWrapperError).errorOrUnknown);
    } else {
      return Future<T>.error(UnknownError());
    }
  }

  Future<Stream<T>> dataStream(
    Future<DataWrapper<Stream<T>>> Function() loadData, {
    Stream<T> Function()? onError,
  }) async {
    final wrapper = await loadData();
    if (wrapper is DataWrapperHasData) {
      final hasData = wrapper as DataWrapperHasData<Stream<T>>;
      return hasData.data;
    } else if (wrapper is DataWrapperError) {
      if (onError == null) return Stream<T>.empty();
      return onError();
    } else {
      return Stream<T>.empty();
    }
  }

  Future<Stream<T>> dataStreamOrError(
      Future<DataWrapper<Stream<T>>> Function() loadData) async {
    final wrapper = await loadData();
    if (wrapper is DataWrapperHasData) {
      final hasData = wrapper as DataWrapperHasData<Stream<T>>;
      return hasData.data;
    } else if (wrapper is DataWrapperError) {
      return Stream<T>.error((wrapper as DataWrapperError).errorOrUnknown);
    } else {
      return Stream<T>.empty();
    }
  }
}
