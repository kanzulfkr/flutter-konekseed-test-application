import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/auth_remote_datasources.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSources dataSource;
  LogoutBloc(this.dataSource) : super(const _Initial()) {
    on<_Logout>(_doLogout);
  }

  Future<void> _doLogout(
    _Logout event,
    Emitter<LogoutState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.logout();
    result.fold(
      (error) => emit(_Error(error: error)),
      (success) => emit(_Loaded(success: success)),
    );
  }
}
