import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_konekseed/data/datasources/product_remote_datasources.dart';
import 'package:flutter_konekseed/data/models/response/product_reponse_models.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDataSources dataSource;
  ProductBloc(this.dataSource) : super(const _Initial()) {
    on<_Product>(_getProduct);
  }

  Future<void> _getProduct(
    _Product event,
    Emitter<ProductState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.getAllProducts();
    result.fold(
      (error) => emit(_Error(message: error)),
      (data) => emit(_Loaded(data: data)),
    );
  }
}
