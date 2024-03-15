import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/variable.dart';
import '../models/response/user_response_models.dart';
import 'auth_local_datasources.dart';

class UserRemoteDataSources {
  Future<Either<String, UserProfileResponseModel>> getUserProfile() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/auth/user";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(UserProfileResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching user profile");
    }
  }
}
