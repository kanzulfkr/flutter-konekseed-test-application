part of 'target_bloc.dart';

@freezed
class TargetState with _$TargetState {
  const factory TargetState.initial() = _Initial;
  const factory TargetState.loading() = _Loading;
  const factory TargetState.loaded({
    required TargetsResponseModel data,
  }) = _Loaded;
  const factory TargetState.error({
    required String message,
  }) = _Error;
}
