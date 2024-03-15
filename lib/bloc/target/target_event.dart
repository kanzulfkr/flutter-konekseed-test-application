part of 'target_bloc.dart';

@freezed
class TargetEvent with _$TargetEvent {
  const factory TargetEvent.started() = _Started;
  const factory TargetEvent.getTarget() = _Target;
}
