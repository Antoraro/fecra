import 'package:equatable/equatable.dart';

sealed class TextFieldError extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyTextFieldError extends TextFieldError {}

class InvalidTextFieldError extends TextFieldError {}

class LongTextFieldError extends TextFieldError {
  final int maxLength;

  LongTextFieldError(this.maxLength);

  @override
  List<Object?> get props => [maxLength];
}

class ShortTextFieldError extends TextFieldError {
  final int minLength;

  ShortTextFieldError(this.minLength);

  @override
  List<Object?> get props => [minLength];
}
