import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_konekseed/data/datasources/business_remote_datasources.dart';
import '../../data/models/request/store_business_request_models.dart';

part 'store_business_event.dart';
part 'store_business_state.dart';
part 'store_business_bloc.freezed.dart';

class StoreBusinessBloc extends Bloc<StoreBusinessEvent, StoreBusinessState> {
  StoreBusinessBloc() : super(const _Initial()) {
    on<_StoreBusiness>((event, emit) async {
      emit(const _Loading());
      final response =
          await BusinessRemoteDataSources().storeBusiness(event.requestModels);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
