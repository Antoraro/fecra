import '../../data/database/database.dart';

class WipeDatabase {
  final AppDb _appDb;

  WipeDatabase(this._appDb);

  Future<void> call() => _appDb.wipe();
}
