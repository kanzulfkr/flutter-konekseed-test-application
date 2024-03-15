part of 'store_business_bloc.dart';

@freezed
class StoreBusinessState with _$StoreBusinessState {
  const factory StoreBusinessState.initial() = _Initial;
  const factory StoreBusinessState.loading() = _Loading;
  const factory StoreBusinessState.loaded(StoreBusinessRequestModel data) =
      _Loaded;
  const factory StoreBusinessState.error(String message) = _Error;
}
