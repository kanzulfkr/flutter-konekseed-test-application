import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/target_remote_datasources.dart';
import '../../data/models/request/update_target_request_models.dart';

part 'update_targets_event.dart';
part 'update_targets_state.dart';
part 'update_targets_bloc.freezed.dart';

class UpdateTargetsBloc extends Bloc<UpdateTargetsEvent, UpdateTargetsState> {
  UpdateTargetsBloc() : super(const _Initial()) {
    on<_UpdateTargets>((event, emit) async {
      emit(const _Loading());
      final response =
          await TargetRemoteDataSources().updateTargets(event.requestModels);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
