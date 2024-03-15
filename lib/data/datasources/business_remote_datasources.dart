import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../common/constant/variable.dart';
import '../models/request/store_business_request_models.dart';
import '../models/response/business_response_model.dart';
import 'auth_local_datasources.dart';

class BusinessRemoteDataSources {
  Future<Either<String, BusinessResponseModel>> getAllBusiness() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/business";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(BusinessResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching Businesss");
    }
  }

  Future<Either<String, StoreBusinessRequestModel>> storeBusiness(
      StoreBusinessRequestModel requestModels) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/business/store'),
      headers: headers,
      body: requestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(StoreBusinessRequestModel.fromJson(response.body));
    } else if (response.statusCode == 422) {
      return const Left(
          'Data yang anda masukkan tidak dapat diproses, harap coba kembali dalam beberapa saat!');
    } else if (response.statusCode == 401) {
      return const Left('Unauthenticated');
    } else {
      return const Left(
          'Server error, harap coba kembali dalam beberapa saat!');
    }
  }

  Future<String> updateStatus(int id, String status) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    final body = {
      'status': status,
    };

    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/business/update-status/$id'),
      headers: headers,
      body: body,
    );
    return response.body;
  }
}
