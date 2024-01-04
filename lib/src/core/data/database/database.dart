import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import "package:path/path.dart" as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  'entities/last_fetched.drift',
  'entities/currency.drift',
  'entities/exchange_rate.drift',
})
class AppDb extends _$AppDb {
  AppDb(super.executor);

  @override
  int get schemaVersion => 1;

  Future<void> wipe() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

Future<DriftIsolate> createDbIsolate() async {
  final token = RootIsolateToken.instance!;

  return await DriftIsolate.spawn(() {
    // This function runs in a new isolate, so we must first initialize the
    // messenger to use platform channels.
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);

    // The callback to DriftIsolate.spawn() must return the database connection
    // to use.
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase(file);
    });
  });
}
