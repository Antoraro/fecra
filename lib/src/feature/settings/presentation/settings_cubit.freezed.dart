// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Duration refreshPeriod, bool isShortExchangeRate)
        content,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Duration refreshPeriod, bool isShortExchangeRate)?
        content,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Duration refreshPeriod, bool isShortExchangeRate)? content,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateContent value) content,
    required TResult Function(SettingsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateContent value)? content,
    TResult? Function(SettingsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateContent value)? content,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SettingsStateLoadingImplCopyWith<$Res> {
  factory _$$SettingsStateLoadingImplCopyWith(_$SettingsStateLoadingImpl value,
          $Res Function(_$SettingsStateLoadingImpl) then) =
      __$$SettingsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateLoadingImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateLoadingImpl>
    implements _$$SettingsStateLoadingImplCopyWith<$Res> {
  __$$SettingsStateLoadingImplCopyWithImpl(_$SettingsStateLoadingImpl _value,
      $Res Function(_$SettingsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SettingsStateLoadingImpl implements SettingsStateLoading {
  const _$SettingsStateLoadingImpl();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Duration refreshPeriod, bool isShortExchangeRate)
        content,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Duration refreshPeriod, bool isShortExchangeRate)?
        content,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Duration refreshPeriod, bool isShortExchangeRate)? content,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateContent value) content,
    required TResult Function(SettingsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateContent value)? content,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateContent value)? content,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoading implements SettingsState {
  const factory SettingsStateLoading() = _$SettingsStateLoadingImpl;
}

/// @nodoc
abstract class _$$SettingsStateContentImplCopyWith<$Res> {
  factory _$$SettingsStateContentImplCopyWith(_$SettingsStateContentImpl value,
          $Res Function(_$SettingsStateContentImpl) then) =
      __$$SettingsStateContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration refreshPeriod, bool isShortExchangeRate});
}

/// @nodoc
class __$$SettingsStateContentImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateContentImpl>
    implements _$$SettingsStateContentImplCopyWith<$Res> {
  __$$SettingsStateContentImplCopyWithImpl(_$SettingsStateContentImpl _value,
      $Res Function(_$SettingsStateContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshPeriod = null,
    Object? isShortExchangeRate = null,
  }) {
    return _then(_$SettingsStateContentImpl(
      refreshPeriod: null == refreshPeriod
          ? _value.refreshPeriod
          : refreshPeriod // ignore: cast_nullable_to_non_nullable
              as Duration,
      isShortExchangeRate: null == isShortExchangeRate
          ? _value.isShortExchangeRate
          : isShortExchangeRate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsStateContentImpl implements SettingsStateContent {
  const _$SettingsStateContentImpl(
      {this.refreshPeriod = AppDurations.refreshPeriod,
      this.isShortExchangeRate = false});

  @override
  @JsonKey()
  final Duration refreshPeriod;
  @override
  @JsonKey()
  final bool isShortExchangeRate;

  @override
  String toString() {
    return 'SettingsState.content(refreshPeriod: $refreshPeriod, isShortExchangeRate: $isShortExchangeRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateContentImpl &&
            (identical(other.refreshPeriod, refreshPeriod) ||
                other.refreshPeriod == refreshPeriod) &&
            (identical(other.isShortExchangeRate, isShortExchangeRate) ||
                other.isShortExchangeRate == isShortExchangeRate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, refreshPeriod, isShortExchangeRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateContentImplCopyWith<_$SettingsStateContentImpl>
      get copyWith =>
          __$$SettingsStateContentImplCopyWithImpl<_$SettingsStateContentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Duration refreshPeriod, bool isShortExchangeRate)
        content,
    required TResult Function() error,
  }) {
    return content(refreshPeriod, isShortExchangeRate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Duration refreshPeriod, bool isShortExchangeRate)?
        content,
    TResult? Function()? error,
  }) {
    return content?.call(refreshPeriod, isShortExchangeRate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Duration refreshPeriod, bool isShortExchangeRate)? content,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(refreshPeriod, isShortExchangeRate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateContent value) content,
    required TResult Function(SettingsStateError value) error,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateContent value)? content,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateContent value)? content,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class SettingsStateContent implements SettingsState {
  const factory SettingsStateContent(
      {final Duration refreshPeriod,
      final bool isShortExchangeRate}) = _$SettingsStateContentImpl;

  Duration get refreshPeriod;
  bool get isShortExchangeRate;
  @JsonKey(ignore: true)
  _$$SettingsStateContentImplCopyWith<_$SettingsStateContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsStateErrorImplCopyWith<$Res> {
  factory _$$SettingsStateErrorImplCopyWith(_$SettingsStateErrorImpl value,
          $Res Function(_$SettingsStateErrorImpl) then) =
      __$$SettingsStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateErrorImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateErrorImpl>
    implements _$$SettingsStateErrorImplCopyWith<$Res> {
  __$$SettingsStateErrorImplCopyWithImpl(_$SettingsStateErrorImpl _value,
      $Res Function(_$SettingsStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SettingsStateErrorImpl implements SettingsStateError {
  const _$SettingsStateErrorImpl();

  @override
  String toString() {
    return 'SettingsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Duration refreshPeriod, bool isShortExchangeRate)
        content,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Duration refreshPeriod, bool isShortExchangeRate)?
        content,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Duration refreshPeriod, bool isShortExchangeRate)? content,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateContent value) content,
    required TResult Function(SettingsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateContent value)? content,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateContent value)? content,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsStateError implements SettingsState {
  const factory SettingsStateError() = _$SettingsStateErrorImpl;
}
