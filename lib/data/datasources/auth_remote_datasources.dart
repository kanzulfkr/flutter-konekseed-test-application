import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'dart:convert';

import '../../common/constant/variable.dart';
import '../models/request/auth_request_models.dart';
import '../models/response/auth_response_models.dart';
import 'auth_local_datasources.dart';

class AuthRemoteDataSources {
  Future<Either<String, AuthResponseModels>> login(
      AuthRequestModels requestModels) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/login'),
      headers: headers,
      body: requestModels.toJson(),
    );

    // if (kDebugMode) {
    //   print(response.body);
    // }

    if (response.statusCode == 200) {
      return Right(AuthResponseModels.fromJson(response.body));
    } else if (response.statusCode == 422) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody.containsKey('errors')) {
        Map<String, dynamic> errors = responseBody['errors'];
        if (errors.containsKey('email')) {
          return const Left('Email salah, harap masukkan data dengan benar!');
        } else if (errors.containsKey('password')) {
          return const Left(
              'Password salah, harap masukkan data dengan benar!');
        }
      }
      return const Left(
          'Data yang anda masukkan tidak dapat diproses, harap coba kembali dalam beberapa saat!');
    } else {
      return const Left(
          'Server error, harap coba kembali dalam beberapa saat!');
    }
  }

  Future<Either<String, String>> logout() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    const baseUrl = "${Variables.baseUrl}/api/auth/logout";

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return const Right('Logout Successfully');
    } else {
      return const Left('Logout Failed');
    }
  }
}
