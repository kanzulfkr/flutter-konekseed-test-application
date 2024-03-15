// part of 'business_bloc.dart';

// @immutable
// sealed class BusinessState {}

// final class BusinessInitial extends BusinessState {}

part of 'business_bloc.dart';

@freezed
class BusinessState with _$BusinessState {
  const factory BusinessState.initial() = _Initial;
  const factory BusinessState.loading() = _Loading;
  const factory BusinessState.loaded({
    required BusinessResponseModel data,
  }) = _Loaded;
  const factory BusinessState.error({
    required String message,
  }) = _Error;
}
