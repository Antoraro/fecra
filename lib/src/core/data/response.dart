import 'package:equatable/equatable.dart';

abstract class Response<A> extends Equatable {}

class ResponseSuccess<A> extends Response<A> {
  final A value;

  ResponseSuccess(this.value);

  @override
  List<Object?> get props => [value];

  @override
  bool? get stringify => true;
}

class ResponseError<A> extends Response<A> {
  final String? errorText;
  final Error? error;

  ResponseError({this.error, this.errorText});

  @override
  List<Object?> get props => [error, errorText];

  @override
  bool? get stringify => true;
}
