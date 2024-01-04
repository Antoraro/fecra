import 'package:equatable/equatable.dart';

import '../database/database.dart';

class LastFetchedDao {
  final AppDb _appDb;

  LastFetchedDao(this._appDb);

  void setLastFetched(LastFetchedKey input, DateTime time) {
    _appDb.insertLastFetchedEntry(input.key, time.toIso8601String());
  }

  Future<DateTime?> getLastFetched(LastFetchedKey input) async {
    final entry = await _appDb.getLastFetchedEntry(input.key).getSingleOrNull();
    if (entry != null) {
      return DateTime.parse(entry);
    }
    return null;
  }

  Stream<String?> getLastFetchedStream(LastFetchedKey input) {
    return _appDb.getLastFetchedEntry(input.key).watchSingleOrNull();
  }
}

abstract class LastFetchedKey extends Equatable {
  final String key;

  const LastFetchedKey(this.key);

  @override
  List<Object?> get props => [key];
}

class LastFetchedKeyCurrencies extends LastFetchedKey {
  const LastFetchedKeyCurrencies() : super('last_fetched_key_currencies');
}

class LastFetchedKeyRates extends LastFetchedKey {
  const LastFetchedKeyRates() : super('last_fetched_key_rates');
}
