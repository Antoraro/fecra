import 'dart:async';

import '../domain/errors.dart';
import 'app_durations.dart';
import 'data_wrapper.dart';
import 'response.dart';

const String _connectionTimeoutError = 'Connection timeout error';

Future<DataWrapper<Stream<D>>> getDataFlowAsCold<D, DTO>({
  required DateTime? lastFetched,
  required Function(DateTime) setLastFetched,
  required Stream<D> Function() getFromLocalSource,
  required Future<Response<DTO>> Function() getFromRemoteSource,
  required Future<void> Function(DTO) setToLocalSource,
  required DateTime Function() getCurrentDateTime,
  required Duration Function() getCacheDuration,
  required Duration Function() getThrottleDuration,
  bool overrideThrottle = false,
}) async {
  final now = getCurrentDateTime();
  final cacheDuration = getCacheDuration();
  final cacheExpiry = lastFetched?.add(cacheDuration);

  final cacheExpired = (lastFetched == null) ||
      (cacheExpiry != null && now.isAfter(cacheExpiry));

  if (cacheExpired) {
    final response = await getFromRemoteSource().timeout(
      AppDurations.connectionTimeout,
      onTimeout: () => ResponseError(
        error: ConnectionError(),
        errorText: _connectionTimeoutError,
      ),
    );
    if (response is ResponseSuccess) {
      final success = response as ResponseSuccess;
      setLastFetched(now);
      await setToLocalSource(success.value);
      return DataWrapperLiveData(getFromLocalSource());
    } else if (response is ResponseError) {
      final error = response as ResponseError;
      // No-op
      return DataWrapperError(error: error.error, errorText: error.errorText);
    } else {
      return DataWrapperError();
    }
  } else {
    final throttleDuration = getThrottleDuration();
    final throttleExpiry = lastFetched.add(throttleDuration);
    final throttleExpired = now.isAfter(throttleExpiry);

    if (throttleExpired || overrideThrottle) {
      // Hit network
      getFromRemoteSource().then((response) {
        if (response is ResponseSuccess) {
          final success = response as ResponseSuccess;
          setLastFetched(now);
          setToLocalSource(success.value);
        } else {
          // No-op
        }
      });
    }

    return DataWrapperCacheData(getFromLocalSource());
  }
}
