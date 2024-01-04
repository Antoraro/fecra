// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class CurrencyEntityTable extends Table
    with TableInfo<CurrencyEntityTable, CurrencyEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CurrencyEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _currencyKeyMeta =
      const VerificationMeta('currencyKey');
  late final GeneratedColumn<String> currencyKey = GeneratedColumn<String>(
      'currency_key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
      'flag', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [currencyKey, name, flag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CurrencyEntity';
  @override
  VerificationContext validateIntegrity(Insertable<CurrencyEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('currency_key')) {
      context.handle(
          _currencyKeyMeta,
          currencyKey.isAcceptableOrUnknown(
              data['currency_key']!, _currencyKeyMeta));
    } else if (isInserting) {
      context.missing(_currencyKeyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
          _flagMeta, flag.isAcceptableOrUnknown(data['flag']!, _flagMeta));
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {currencyKey};
  @override
  CurrencyEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyEntity(
      currencyKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_key'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      flag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag'])!,
    );
  }

  @override
  CurrencyEntityTable createAlias(String alias) {
    return CurrencyEntityTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CurrencyEntity extends DataClass implements Insertable<CurrencyEntity> {
  final String currencyKey;
  final String name;
  final String flag;
  const CurrencyEntity(
      {required this.currencyKey, required this.name, required this.flag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['currency_key'] = Variable<String>(currencyKey);
    map['name'] = Variable<String>(name);
    map['flag'] = Variable<String>(flag);
    return map;
  }

  CurrencyEntityCompanion toCompanion(bool nullToAbsent) {
    return CurrencyEntityCompanion(
      currencyKey: Value(currencyKey),
      name: Value(name),
      flag: Value(flag),
    );
  }

  factory CurrencyEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyEntity(
      currencyKey: serializer.fromJson<String>(json['currency_key']),
      name: serializer.fromJson<String>(json['name']),
      flag: serializer.fromJson<String>(json['flag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'currency_key': serializer.toJson<String>(currencyKey),
      'name': serializer.toJson<String>(name),
      'flag': serializer.toJson<String>(flag),
    };
  }

  CurrencyEntity copyWith({String? currencyKey, String? name, String? flag}) =>
      CurrencyEntity(
        currencyKey: currencyKey ?? this.currencyKey,
        name: name ?? this.name,
        flag: flag ?? this.flag,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyEntity(')
          ..write('currencyKey: $currencyKey, ')
          ..write('name: $name, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(currencyKey, name, flag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyEntity &&
          other.currencyKey == this.currencyKey &&
          other.name == this.name &&
          other.flag == this.flag);
}

class CurrencyEntityCompanion extends UpdateCompanion<CurrencyEntity> {
  final Value<String> currencyKey;
  final Value<String> name;
  final Value<String> flag;
  final Value<int> rowid;
  const CurrencyEntityCompanion({
    this.currencyKey = const Value.absent(),
    this.name = const Value.absent(),
    this.flag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyEntityCompanion.insert({
    required String currencyKey,
    required String name,
    required String flag,
    this.rowid = const Value.absent(),
  })  : currencyKey = Value(currencyKey),
        name = Value(name),
        flag = Value(flag);
  static Insertable<CurrencyEntity> custom({
    Expression<String>? currencyKey,
    Expression<String>? name,
    Expression<String>? flag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (currencyKey != null) 'currency_key': currencyKey,
      if (name != null) 'name': name,
      if (flag != null) 'flag': flag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyEntityCompanion copyWith(
      {Value<String>? currencyKey,
      Value<String>? name,
      Value<String>? flag,
      Value<int>? rowid}) {
    return CurrencyEntityCompanion(
      currencyKey: currencyKey ?? this.currencyKey,
      name: name ?? this.name,
      flag: flag ?? this.flag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (currencyKey.present) {
      map['currency_key'] = Variable<String>(currencyKey.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyEntityCompanion(')
          ..write('currencyKey: $currencyKey, ')
          ..write('name: $name, ')
          ..write('flag: $flag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ExchangeRateEntityTable extends Table
    with TableInfo<ExchangeRateEntityTable, ExchangeRateEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ExchangeRateEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  late final GeneratedColumn<String> currencyId = GeneratedColumn<String>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _exchangeMeta =
      const VerificationMeta('exchange');
  late final GeneratedColumn<double> exchange = GeneratedColumn<double>(
      'exchange', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, currencyId, timestamp, exchange];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ExchangeRateEntity';
  @override
  VerificationContext validateIntegrity(Insertable<ExchangeRateEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('exchange')) {
      context.handle(_exchangeMeta,
          exchange.isAcceptableOrUnknown(data['exchange']!, _exchangeMeta));
    } else if (isInserting) {
      context.missing(_exchangeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExchangeRateEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExchangeRateEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
      exchange: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange'])!,
    );
  }

  @override
  ExchangeRateEntityTable createAlias(String alias) {
    return ExchangeRateEntityTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['FOREIGN KEY(currency_id)REFERENCES CurrencyEntity(currency_key)'];
  @override
  bool get dontWriteConstraints => true;
}

class ExchangeRateEntity extends DataClass
    implements Insertable<ExchangeRateEntity> {
  final int id;
  final String currencyId;
  final int timestamp;
  final double exchange;
  const ExchangeRateEntity(
      {required this.id,
      required this.currencyId,
      required this.timestamp,
      required this.exchange});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['currency_id'] = Variable<String>(currencyId);
    map['timestamp'] = Variable<int>(timestamp);
    map['exchange'] = Variable<double>(exchange);
    return map;
  }

  ExchangeRateEntityCompanion toCompanion(bool nullToAbsent) {
    return ExchangeRateEntityCompanion(
      id: Value(id),
      currencyId: Value(currencyId),
      timestamp: Value(timestamp),
      exchange: Value(exchange),
    );
  }

  factory ExchangeRateEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExchangeRateEntity(
      id: serializer.fromJson<int>(json['id']),
      currencyId: serializer.fromJson<String>(json['currency_id']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      exchange: serializer.fromJson<double>(json['exchange']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currency_id': serializer.toJson<String>(currencyId),
      'timestamp': serializer.toJson<int>(timestamp),
      'exchange': serializer.toJson<double>(exchange),
    };
  }

  ExchangeRateEntity copyWith(
          {int? id, String? currencyId, int? timestamp, double? exchange}) =>
      ExchangeRateEntity(
        id: id ?? this.id,
        currencyId: currencyId ?? this.currencyId,
        timestamp: timestamp ?? this.timestamp,
        exchange: exchange ?? this.exchange,
      );
  @override
  String toString() {
    return (StringBuffer('ExchangeRateEntity(')
          ..write('id: $id, ')
          ..write('currencyId: $currencyId, ')
          ..write('timestamp: $timestamp, ')
          ..write('exchange: $exchange')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, currencyId, timestamp, exchange);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExchangeRateEntity &&
          other.id == this.id &&
          other.currencyId == this.currencyId &&
          other.timestamp == this.timestamp &&
          other.exchange == this.exchange);
}

class ExchangeRateEntityCompanion extends UpdateCompanion<ExchangeRateEntity> {
  final Value<int> id;
  final Value<String> currencyId;
  final Value<int> timestamp;
  final Value<double> exchange;
  const ExchangeRateEntityCompanion({
    this.id = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.exchange = const Value.absent(),
  });
  ExchangeRateEntityCompanion.insert({
    this.id = const Value.absent(),
    required String currencyId,
    required int timestamp,
    required double exchange,
  })  : currencyId = Value(currencyId),
        timestamp = Value(timestamp),
        exchange = Value(exchange);
  static Insertable<ExchangeRateEntity> custom({
    Expression<int>? id,
    Expression<String>? currencyId,
    Expression<int>? timestamp,
    Expression<double>? exchange,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currencyId != null) 'currency_id': currencyId,
      if (timestamp != null) 'timestamp': timestamp,
      if (exchange != null) 'exchange': exchange,
    });
  }

  ExchangeRateEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? currencyId,
      Value<int>? timestamp,
      Value<double>? exchange}) {
    return ExchangeRateEntityCompanion(
      id: id ?? this.id,
      currencyId: currencyId ?? this.currencyId,
      timestamp: timestamp ?? this.timestamp,
      exchange: exchange ?? this.exchange,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<String>(currencyId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (exchange.present) {
      map['exchange'] = Variable<double>(exchange.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExchangeRateEntityCompanion(')
          ..write('id: $id, ')
          ..write('currencyId: $currencyId, ')
          ..write('timestamp: $timestamp, ')
          ..write('exchange: $exchange')
          ..write(')'))
        .toString();
  }
}

class ExchangeRateWithCurrencyViewData extends DataClass {
  final int id;
  final String currencyId;
  final int timestamp;
  final double exchange;
  final String currencyKey;
  final String name;
  final String flag;
  const ExchangeRateWithCurrencyViewData(
      {required this.id,
      required this.currencyId,
      required this.timestamp,
      required this.exchange,
      required this.currencyKey,
      required this.name,
      required this.flag});
  factory ExchangeRateWithCurrencyViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExchangeRateWithCurrencyViewData(
      id: serializer.fromJson<int>(json['id']),
      currencyId: serializer.fromJson<String>(json['currency_id']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      exchange: serializer.fromJson<double>(json['exchange']),
      currencyKey: serializer.fromJson<String>(json['currency_key']),
      name: serializer.fromJson<String>(json['name']),
      flag: serializer.fromJson<String>(json['flag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currency_id': serializer.toJson<String>(currencyId),
      'timestamp': serializer.toJson<int>(timestamp),
      'exchange': serializer.toJson<double>(exchange),
      'currency_key': serializer.toJson<String>(currencyKey),
      'name': serializer.toJson<String>(name),
      'flag': serializer.toJson<String>(flag),
    };
  }

  ExchangeRateWithCurrencyViewData copyWith(
          {int? id,
          String? currencyId,
          int? timestamp,
          double? exchange,
          String? currencyKey,
          String? name,
          String? flag}) =>
      ExchangeRateWithCurrencyViewData(
        id: id ?? this.id,
        currencyId: currencyId ?? this.currencyId,
        timestamp: timestamp ?? this.timestamp,
        exchange: exchange ?? this.exchange,
        currencyKey: currencyKey ?? this.currencyKey,
        name: name ?? this.name,
        flag: flag ?? this.flag,
      );
  @override
  String toString() {
    return (StringBuffer('ExchangeRateWithCurrencyViewData(')
          ..write('id: $id, ')
          ..write('currencyId: $currencyId, ')
          ..write('timestamp: $timestamp, ')
          ..write('exchange: $exchange, ')
          ..write('currencyKey: $currencyKey, ')
          ..write('name: $name, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, currencyId, timestamp, exchange, currencyKey, name, flag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExchangeRateWithCurrencyViewData &&
          other.id == this.id &&
          other.currencyId == this.currencyId &&
          other.timestamp == this.timestamp &&
          other.exchange == this.exchange &&
          other.currencyKey == this.currencyKey &&
          other.name == this.name &&
          other.flag == this.flag);
}

class ExchangeRateWithCurrencyView extends ViewInfo<
    ExchangeRateWithCurrencyView,
    ExchangeRateWithCurrencyViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  ExchangeRateWithCurrencyView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns =>
      [id, currencyId, timestamp, exchange, currencyKey, name, flag];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'ExchangeRateWithCurrencyView';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW ExchangeRateWithCurrencyView AS SELECT R.*, C.* FROM ExchangeRateEntity AS R INNER JOIN CurrencyEntity AS C ON R.currency_id = C.currency_key',
      };
  @override
  ExchangeRateWithCurrencyView get asDslTable => this;
  @override
  ExchangeRateWithCurrencyViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExchangeRateWithCurrencyViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
      exchange: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange'])!,
      currencyKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_key'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      flag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag'])!,
    );
  }

  late final GeneratedColumn<int> id =
      GeneratedColumn<int>('id', aliasedName, false, type: DriftSqlType.int);
  late final GeneratedColumn<String> currencyId = GeneratedColumn<String>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int);
  late final GeneratedColumn<double> exchange = GeneratedColumn<double>(
      'exchange', aliasedName, false,
      type: DriftSqlType.double);
  late final GeneratedColumn<String> currencyKey = GeneratedColumn<String>(
      'currency_key', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
      'flag', aliasedName, false,
      type: DriftSqlType.string);
  @override
  ExchangeRateWithCurrencyView createAlias(String alias) {
    return ExchangeRateWithCurrencyView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'ExchangeRateEntity', 'CurrencyEntity'};
}

class CurrencyWithExchangeRatesViewData extends DataClass {
  final String currencyKey;
  final String name;
  final String flag;
  final int id;
  final String currencyId;
  final int timestamp;
  final double exchange;
  const CurrencyWithExchangeRatesViewData(
      {required this.currencyKey,
      required this.name,
      required this.flag,
      required this.id,
      required this.currencyId,
      required this.timestamp,
      required this.exchange});
  factory CurrencyWithExchangeRatesViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyWithExchangeRatesViewData(
      currencyKey: serializer.fromJson<String>(json['currency_key']),
      name: serializer.fromJson<String>(json['name']),
      flag: serializer.fromJson<String>(json['flag']),
      id: serializer.fromJson<int>(json['id']),
      currencyId: serializer.fromJson<String>(json['currency_id']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      exchange: serializer.fromJson<double>(json['exchange']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'currency_key': serializer.toJson<String>(currencyKey),
      'name': serializer.toJson<String>(name),
      'flag': serializer.toJson<String>(flag),
      'id': serializer.toJson<int>(id),
      'currency_id': serializer.toJson<String>(currencyId),
      'timestamp': serializer.toJson<int>(timestamp),
      'exchange': serializer.toJson<double>(exchange),
    };
  }

  CurrencyWithExchangeRatesViewData copyWith(
          {String? currencyKey,
          String? name,
          String? flag,
          int? id,
          String? currencyId,
          int? timestamp,
          double? exchange}) =>
      CurrencyWithExchangeRatesViewData(
        currencyKey: currencyKey ?? this.currencyKey,
        name: name ?? this.name,
        flag: flag ?? this.flag,
        id: id ?? this.id,
        currencyId: currencyId ?? this.currencyId,
        timestamp: timestamp ?? this.timestamp,
        exchange: exchange ?? this.exchange,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyWithExchangeRatesViewData(')
          ..write('currencyKey: $currencyKey, ')
          ..write('name: $name, ')
          ..write('flag: $flag, ')
          ..write('id: $id, ')
          ..write('currencyId: $currencyId, ')
          ..write('timestamp: $timestamp, ')
          ..write('exchange: $exchange')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(currencyKey, name, flag, id, currencyId, timestamp, exchange);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyWithExchangeRatesViewData &&
          other.currencyKey == this.currencyKey &&
          other.name == this.name &&
          other.flag == this.flag &&
          other.id == this.id &&
          other.currencyId == this.currencyId &&
          other.timestamp == this.timestamp &&
          other.exchange == this.exchange);
}

class CurrencyWithExchangeRatesView extends ViewInfo<
    CurrencyWithExchangeRatesView,
    CurrencyWithExchangeRatesViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  CurrencyWithExchangeRatesView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns =>
      [currencyKey, name, flag, id, currencyId, timestamp, exchange];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'CurrencyWithExchangeRatesView';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW CurrencyWithExchangeRatesView AS SELECT C.*, R.* FROM CurrencyEntity AS C INNER JOIN ExchangeRateEntity AS R ON R.currency_id = C.currency_key',
      };
  @override
  CurrencyWithExchangeRatesView get asDslTable => this;
  @override
  CurrencyWithExchangeRatesViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyWithExchangeRatesViewData(
      currencyKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_key'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      flag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
      exchange: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange'])!,
    );
  }

  late final GeneratedColumn<String> currencyKey = GeneratedColumn<String>(
      'currency_key', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
      'flag', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<int> id =
      GeneratedColumn<int>('id', aliasedName, false, type: DriftSqlType.int);
  late final GeneratedColumn<String> currencyId = GeneratedColumn<String>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int);
  late final GeneratedColumn<double> exchange = GeneratedColumn<double>(
      'exchange', aliasedName, false,
      type: DriftSqlType.double);
  @override
  CurrencyWithExchangeRatesView createAlias(String alias) {
    return CurrencyWithExchangeRatesView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'CurrencyEntity', 'ExchangeRateEntity'};
}

class LastFetchedEntity extends Table
    with TableInfo<LastFetchedEntity, LastFetchedEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LastFetchedEntity(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _dateStringMeta =
      const VerificationMeta('dateString');
  late final GeneratedColumn<String> dateString = GeneratedColumn<String>(
      'dateString', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, dateString];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'LastFetchedEntity';
  @override
  VerificationContext validateIntegrity(
      Insertable<LastFetchedEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('dateString')) {
      context.handle(
          _dateStringMeta,
          dateString.isAcceptableOrUnknown(
              data['dateString']!, _dateStringMeta));
    } else if (isInserting) {
      context.missing(_dateStringMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LastFetchedEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LastFetchedEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      dateString: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateString'])!,
    );
  }

  @override
  LastFetchedEntity createAlias(String alias) {
    return LastFetchedEntity(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LastFetchedEntityData extends DataClass
    implements Insertable<LastFetchedEntityData> {
  final String id;
  final String dateString;
  const LastFetchedEntityData({required this.id, required this.dateString});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['dateString'] = Variable<String>(dateString);
    return map;
  }

  LastFetchedEntityCompanion toCompanion(bool nullToAbsent) {
    return LastFetchedEntityCompanion(
      id: Value(id),
      dateString: Value(dateString),
    );
  }

  factory LastFetchedEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LastFetchedEntityData(
      id: serializer.fromJson<String>(json['id']),
      dateString: serializer.fromJson<String>(json['dateString']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dateString': serializer.toJson<String>(dateString),
    };
  }

  LastFetchedEntityData copyWith({String? id, String? dateString}) =>
      LastFetchedEntityData(
        id: id ?? this.id,
        dateString: dateString ?? this.dateString,
      );
  @override
  String toString() {
    return (StringBuffer('LastFetchedEntityData(')
          ..write('id: $id, ')
          ..write('dateString: $dateString')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateString);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LastFetchedEntityData &&
          other.id == this.id &&
          other.dateString == this.dateString);
}

class LastFetchedEntityCompanion
    extends UpdateCompanion<LastFetchedEntityData> {
  final Value<String> id;
  final Value<String> dateString;
  final Value<int> rowid;
  const LastFetchedEntityCompanion({
    this.id = const Value.absent(),
    this.dateString = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LastFetchedEntityCompanion.insert({
    required String id,
    required String dateString,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        dateString = Value(dateString);
  static Insertable<LastFetchedEntityData> custom({
    Expression<String>? id,
    Expression<String>? dateString,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateString != null) 'dateString': dateString,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LastFetchedEntityCompanion copyWith(
      {Value<String>? id, Value<String>? dateString, Value<int>? rowid}) {
    return LastFetchedEntityCompanion(
      id: id ?? this.id,
      dateString: dateString ?? this.dateString,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dateString.present) {
      map['dateString'] = Variable<String>(dateString.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LastFetchedEntityCompanion(')
          ..write('id: $id, ')
          ..write('dateString: $dateString, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final CurrencyEntityTable currencyEntity = CurrencyEntityTable(this);
  late final ExchangeRateEntityTable exchangeRateEntity =
      ExchangeRateEntityTable(this);
  late final ExchangeRateWithCurrencyView exchangeRateWithCurrencyView =
      ExchangeRateWithCurrencyView(this);
  late final CurrencyWithExchangeRatesView currencyWithExchangeRatesView =
      CurrencyWithExchangeRatesView(this);
  late final LastFetchedEntity lastFetchedEntity = LastFetchedEntity(this);
  Future<int> insertExchangeRate(
      int id, String timestamp, int exchange, double currencyId) {
    return customInsert(
      'INSERT OR REPLACE INTO ExchangeRateEntity VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<int>(id),
        Variable<String>(timestamp),
        Variable<int>(exchange),
        Variable<double>(currencyId)
      ],
      updates: {exchangeRateEntity},
    );
  }

  Future<int> deleteAllExchangeRates() {
    return customUpdate(
      'DELETE FROM ExchangeRateEntity',
      variables: [],
      updates: {exchangeRateEntity},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<ExchangeRateWithCurrencyViewData> getAllExchangeRates() {
    return customSelect(
        'SELECT * FROM ExchangeRateWithCurrencyView ORDER BY timestamp DESC',
        variables: [],
        readsFrom: {
          exchangeRateEntity,
          currencyEntity,
        }).asyncMap(exchangeRateWithCurrencyView.mapFromRow);
  }

  Future<int> insertCurrency(String currencyKey, String name, String flag) {
    return customInsert(
      'INSERT OR REPLACE INTO CurrencyEntity VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(currencyKey),
        Variable<String>(name),
        Variable<String>(flag)
      ],
      updates: {currencyEntity},
    );
  }

  Future<int> deleteCurrency(String currencyKey) {
    return customUpdate(
      'DELETE FROM CurrencyEntity WHERE currency_key = ?1',
      variables: [Variable<String>(currencyKey)],
      updates: {currencyEntity},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteAllCurrencies() {
    return customUpdate(
      'DELETE FROM CurrencyEntity',
      variables: [],
      updates: {currencyEntity},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<CurrencyWithExchangeRatesViewData> getAllCurrencies() {
    return customSelect(
        'SELECT * FROM CurrencyWithExchangeRatesView ORDER BY timestamp DESC',
        variables: [],
        readsFrom: {
          currencyEntity,
          exchangeRateEntity,
        }).asyncMap(currencyWithExchangeRatesView.mapFromRow);
  }

  Selectable<CurrencyWithExchangeRatesViewData> getCurrencyByKey(
      String currencyKey) {
    return customSelect(
        'SELECT * FROM CurrencyWithExchangeRatesView WHERE currency_key = ?1 ORDER BY timestamp DESC',
        variables: [
          Variable<String>(currencyKey)
        ],
        readsFrom: {
          currencyEntity,
          exchangeRateEntity,
        }).asyncMap(currencyWithExchangeRatesView.mapFromRow);
  }

  Future<int> insertLastFetchedEntry(String id, String dateString) {
    return customInsert(
      'INSERT OR REPLACE INTO LastFetchedEntity (id, dateString) VALUES (?1, ?2)',
      variables: [Variable<String>(id), Variable<String>(dateString)],
      updates: {lastFetchedEntity},
    );
  }

  Selectable<String> getLastFetchedEntry(String id) {
    return customSelect(
        'SELECT dateString FROM LastFetchedEntity WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          lastFetchedEntity,
        }).map((QueryRow row) => row.read<String>('dateString'));
  }

  Future<int> clearLastFetchedEntry(String id) {
    return customUpdate(
      'DELETE FROM LastFetchedEntity WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {lastFetchedEntity},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clearLastFetched() {
    return customUpdate(
      'DELETE FROM LastFetchedEntity',
      variables: [],
      updates: {lastFetchedEntity},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        currencyEntity,
        exchangeRateEntity,
        exchangeRateWithCurrencyView,
        currencyWithExchangeRatesView,
        lastFetchedEntity
      ];
}
