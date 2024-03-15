import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../common/constant/variable.dart';
import '../models/request/store_target_request_models.dart';
import '../models/request/update_target_request_models.dart';
import '../models/response/targets_response_models.dart';
import 'auth_local_datasources.dart';

class TargetRemoteDataSources {
  Future<Either<String, TargetsResponseModel>> getAllTargets() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/targets";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(TargetsResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching Targets");
    }
  }

  Future<Either<String, StoreTargetRequestModel>> storeTarget(
      StoreTargetRequestModel requestModels) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/targets/store'),
      headers: headers,
      body: requestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(StoreTargetRequestModel.fromJson(response.body));
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

  Future<Either<String, UpdateTargetRequestModel>> updateTargets(
      UpdateTargetRequestModel requestModels) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/targets/update/${requestModels.id}/'),
      headers: headers,
      body: requestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(UpdateTargetRequestModel.fromJson(response.body));
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

  Future<String> deleteTargets(int id) async {
    final loginToken = await AuthLocalDataSources().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/targets/delete/$id'),
      headers: headers,
    );
    return response.body;
  }

  Future<dynamic> getAllProductSearch() async {
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
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    // print(response.body);
    return jsonResponse;
  }
}
