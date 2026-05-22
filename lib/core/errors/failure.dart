import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.network() = _Network;
  const factory Failure.serverError({required int statusCode}) = _ServerError;
  const factory Failure.notFound() = _NotFound;
  const factory Failure.unknown() = _Unknown;
}
