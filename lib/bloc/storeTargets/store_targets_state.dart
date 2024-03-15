part of 'store_targets_bloc.dart';

@freezed
class StoreTargetState with _$StoreTargetState {
  const factory StoreTargetState.initial() = _Initial;
  const factory StoreTargetState.loading() = _Loading;
  const factory StoreTargetState.loaded(StoreTargetRequestModel data) = _Loaded;
  const factory StoreTargetState.error(String message) = _Error;
}
