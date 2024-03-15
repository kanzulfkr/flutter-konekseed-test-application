part of 'update_targets_bloc.dart';

@freezed
class UpdateTargetsEvent with _$UpdateTargetsEvent {
  const factory UpdateTargetsEvent.started() = _Started;
  const factory UpdateTargetsEvent.updateTargets(
      UpdateTargetRequestModel requestModels) = _UpdateTargets;
}
