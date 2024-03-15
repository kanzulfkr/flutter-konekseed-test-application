part of 'store_business_bloc.dart';

@freezed
class StoreBusinessEvent with _$StoreBusinessEvent {
  const factory StoreBusinessEvent.started() = _Started;
  const factory StoreBusinessEvent.storeBusiness(
      StoreBusinessRequestModel requestModels) = _StoreBusiness;
}
