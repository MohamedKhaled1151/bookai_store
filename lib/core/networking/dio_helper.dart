import 'package:bookia/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:bookia/core/local/local_constants.dart';

import '../local/local_helper.dart';

class DioHelper {
  static Dio? _dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    _dio = Dio(options);
    _dio!.interceptors.add(PrettyDioLogger());
  }

  static Future<Response?> postRequest({
    required String endPoint,

    Map<String, dynamic>? data,
    bool? withToken,
  }) async {
    print("token:${LocalHelper.getString(LocalConstants.token)}");
    if (withToken ?? false) {
      _dio?.options.headers = {
        "authorization":
            "Bearer ${LocalHelper.getString(LocalConstants.token)}",
      };
    }
    return await _dio?.post(endPoint, data: data);
  }

  static Future<Response?> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool? withToken,
  }) async {
    print("token:${LocalHelper.getString(LocalConstants.token)}");

    if (withToken ?? false) {
      _dio?.options.headers = {
        "authorization":
            "Bearer ${LocalHelper.getString(LocalConstants.token)}",
      };
    }

    return await _dio?.get(endPoint, queryParameters: data);
  }
}
