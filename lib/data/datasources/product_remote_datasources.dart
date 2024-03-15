import 'package:dartz/dartz.dart';
import 'package:flutter_konekseed/data/models/response/product_reponse_models.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/variable.dart';
import 'auth_local_datasources.dart';

class ProductRemoteDataSources {
  Future<Either<String, ProductResponseModel>> getAllProducts() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/products";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching products");
    }
  }
}
