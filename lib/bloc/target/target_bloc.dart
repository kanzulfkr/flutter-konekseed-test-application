import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/target_remote_datasources.dart';
import '../../data/models/response/targets_response_models.dart';

part 'target_event.dart';
part 'target_state.dart';
part 'target_bloc.freezed.dart';

class TargetBloc extends Bloc<TargetEvent, TargetState> {
  final TargetRemoteDataSources dataSource;
  TargetBloc(this.dataSource) : super(const _Initial()) {
    on<_Target>(_getTarget);
  }

  Future<void> _getTarget(
    _Target event,
    Emitter<TargetState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.getAllTargets();
    result.fold(
      (error) => emit(_Error(message: error)),
      (data) => emit(_Loaded(data: data)),
    );
  }
}
