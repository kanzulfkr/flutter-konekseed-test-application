part of 'update_targets_bloc.dart';

@freezed
class UpdateTargetsState with _$UpdateTargetsState {
  const factory UpdateTargetsState.initial() = _Initial;
  const factory UpdateTargetsState.loading() = _Loading;
  const factory UpdateTargetsState.loaded(UpdateTargetRequestModel data) =
      _Loaded;
  const factory UpdateTargetsState.error(String message) = _Error;
}
