// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_rates_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyRatesDTO _$CurrencyRatesDTOFromJson(Map<String, dynamic> json) {
  return CurrencyRatesDTOData.fromJson(json);
}

/// @nodoc
mixin _$CurrencyRatesDTO {
  List<CurrencyDTO> get currencies => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyRatesDTOCopyWith<CurrencyRatesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRatesDTOCopyWith<$Res> {
  factory $CurrencyRatesDTOCopyWith(
          CurrencyRatesDTO value, $Res Function(CurrencyRatesDTO) then) =
      _$CurrencyRatesDTOCopyWithImpl<$Res, CurrencyRatesDTO>;
  @useResult
  $Res call({List<CurrencyDTO> currencies, int timestamp});
}

/// @nodoc
class _$CurrencyRatesDTOCopyWithImpl<$Res, $Val extends CurrencyRatesDTO>
    implements $CurrencyRatesDTOCopyWith<$Res> {
  _$CurrencyRatesDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyDTO>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyRatesDTODataImplCopyWith<$Res>
    implements $CurrencyRatesDTOCopyWith<$Res> {
  factory _$$CurrencyRatesDTODataImplCopyWith(_$CurrencyRatesDTODataImpl value,
          $Res Function(_$CurrencyRatesDTODataImpl) then) =
      __$$CurrencyRatesDTODataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CurrencyDTO> currencies, int timestamp});
}

/// @nodoc
class __$$CurrencyRatesDTODataImplCopyWithImpl<$Res>
    extends _$CurrencyRatesDTOCopyWithImpl<$Res, _$CurrencyRatesDTODataImpl>
    implements _$$CurrencyRatesDTODataImplCopyWith<$Res> {
  __$$CurrencyRatesDTODataImplCopyWithImpl(_$CurrencyRatesDTODataImpl _value,
      $Res Function(_$CurrencyRatesDTODataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? timestamp = null,
  }) {
    return _then(_$CurrencyRatesDTODataImpl(
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyDTO>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyRatesDTODataImpl implements CurrencyRatesDTOData {
  const _$CurrencyRatesDTODataImpl(
      {required final List<CurrencyDTO> currencies, required this.timestamp})
      : _currencies = currencies;

  factory _$CurrencyRatesDTODataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyRatesDTODataImplFromJson(json);

  final List<CurrencyDTO> _currencies;
  @override
  List<CurrencyDTO> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  final int timestamp;

  @override
  String toString() {
    return 'CurrencyRatesDTO(currencies: $currencies, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyRatesDTODataImpl &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currencies), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyRatesDTODataImplCopyWith<_$CurrencyRatesDTODataImpl>
      get copyWith =>
          __$$CurrencyRatesDTODataImplCopyWithImpl<_$CurrencyRatesDTODataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyRatesDTODataImplToJson(
      this,
    );
  }
}

abstract class CurrencyRatesDTOData implements CurrencyRatesDTO {
  const factory CurrencyRatesDTOData(
      {required final List<CurrencyDTO> currencies,
      required final int timestamp}) = _$CurrencyRatesDTODataImpl;

  factory CurrencyRatesDTOData.fromJson(Map<String, dynamic> json) =
      _$CurrencyRatesDTODataImpl.fromJson;

  @override
  List<CurrencyDTO> get currencies;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyRatesDTODataImplCopyWith<_$CurrencyRatesDTODataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
