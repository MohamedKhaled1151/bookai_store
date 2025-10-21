import 'package:bookia/core/local/local_constants.dart';
import 'package:bookia/core/local/local_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthRepo {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "https://codingarabic.online/api",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );
  static register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        "/register",

        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      if (response.statusCode == 201) {
        LocalHelper.setString(
          LocalConstants.token,
          response?.data["data"]["token"],
        );
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint("Error: ${e.response?.data}");
      return e.response?.data.toString();
    }
  }
}
