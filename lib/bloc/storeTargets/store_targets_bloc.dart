import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/target_remote_datasources.dart';
import '../../data/models/request/store_target_request_models.dart';

part 'store_targets_event.dart';
part 'store_targets_state.dart';
part 'store_targets_bloc.freezed.dart';

class StoreTargetBloc extends Bloc<StoreTargetEvent, StoreTargetState> {
  StoreTargetBloc() : super(const _Initial()) {
    on<_StoreTarget>((event, emit) async {
      emit(const _Loading());
      final response =
          await TargetRemoteDataSources().storeTarget(event.requestModels);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
