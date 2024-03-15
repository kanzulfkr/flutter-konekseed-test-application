part of 'business_bloc.dart';

@freezed
class BusinessEvent with _$BusinessEvent {
  const factory BusinessEvent.started() = _Started;
  const factory BusinessEvent.getBusiness() = _Business;
}
