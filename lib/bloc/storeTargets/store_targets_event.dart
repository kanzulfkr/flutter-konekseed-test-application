part of 'store_targets_bloc.dart';

@freezed
class StoreTargetEvent with _$StoreTargetEvent {
  const factory StoreTargetEvent.started() = _Started;
  const factory StoreTargetEvent.storeTarget(
      StoreTargetRequestModel requestModels) = _StoreTarget;
}
