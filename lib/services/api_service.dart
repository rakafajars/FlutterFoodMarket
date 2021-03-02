import 'package:dio/dio.dart';
import 'package:flutter_food_market/config/environment.dart';
import 'package:flutter_food_market/services/repository.dart';
import 'package:flutter_food_market/utils/logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService implements Repository {
  Dio get dio => _dio();

  Response response;

  // set default configs
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: 60000,
      receiveTimeout: 50000,
      contentType: 'application/json',
    );
    var dio = Dio(options);
    dio.interceptors.add(LogginInterceptors());
    return dio;
  }

  // Menangkap Error yang terjadi pada server
  String _showException(final error, final stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return "Failed Get Data";
  }

  // Menyimpan Token secara global
  Future<String> _getTokenPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }

  @override
  Future<String> loginUser(
    String email,
    String password,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      response = await dio.post(
        'api/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      String token = response.data["data"]["access_token"];
      prefs.setString('token', token);

      return response.data["meta"]["message"];
    } on DioError catch (e) {
      throw e.response.data["meta"]["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }
}
