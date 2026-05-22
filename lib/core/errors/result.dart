import 'package:freezed_annotation/freezed_annotation.dart';
import 'failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(Failure failure) = Error<T>;
}
