import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/business_remote_datasources.dart';
import '../../data/models/response/business_response_model.dart';

part 'business_event.dart';
part 'business_state.dart';
part 'business_bloc.freezed.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final BusinessRemoteDataSources dataSource;
  BusinessBloc(this.dataSource) : super(const _Initial()) {
    on<_Business>(_getBusiness);
  }

  Future<void> _getBusiness(
    _Business event,
    Emitter<BusinessState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.getAllBusiness();
    result.fold(
      (error) => emit(_Error(message: error)),
      (data) => emit(_Loaded(data: data)),
    );
  }
}
