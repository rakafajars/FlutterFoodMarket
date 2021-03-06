import 'package:dio/dio.dart';
import 'package:flutter_food_market/config/environment.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/post_register.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/services/repository.dart';
import 'package:flutter_food_market/utils/logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

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
    SharedPreferences prefsIdUser = await SharedPreferences.getInstance();

    try {
      response = await dio.post(
        'login',
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

  @override
  Future<String> postLogoutUser() async {
    String token = await _getTokenPreference();

    try {
      response = await dio.post(
        'logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      return response.data["meta"]["message"];
    } on DioError catch (e) {
      throw e.response.data["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<String> registerUser(PostRegister register) async {
    try {
      response = await dio.post('register', data: {
        "name": register.name,
        "email": register.email,
        "password": register.password,
        "password_confirmation": register.passwordConfirmation,
        "address": register.address,
        "city": register.city,
        "houserNumber": register.houseNumber,
        "phoneNumber": register.phoneNumber,
      });
      return response.data["meta"]["message"];
    } on DioError catch (e) {
      throw e.response.data["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<String> updateUser(PostRegister register) async {
    String token = await _getTokenPreference();

    try {
      response = await dio.post(
        'user',
        data: {
          "name": register.name,
          "email": register.email,
          "address": register.address,
          "city": register.city,
          "houserNumber": register.houseNumber,
          "phoneNumber": register.phoneNumber,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      return response.data["meta"]["message"];
    } on DioError catch (e) {
      throw e.response.data["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<String> updatePhotoUser(String filePath) async {
    String token = await _getTokenPreference();
    try {
      MediaType mediaType = MediaType(
        "file",
        "jpg",
      );

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, contentType: mediaType),
      });

      response = await dio.post(
        'user/photo',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          contentType: 'multipart/form-data',
        ),
        data: formData,
      );

      return response.data["meta"]["message"];
    } on DioError catch (e) {
      throw e.response.data["meta"]["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<User> getUser() async {
    String token = await _getTokenPreference();

    try {
      response = await dio.get(
        'user',
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );

      return User.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response.data["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<Food> getFood(String typeFood) async {
    try {
      response = await dio.get(
        'food?types=${typeFood == null ? '' : typeFood}',
      );
      return Food.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response.data["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<Transaction> getTransaction() async {
    String token = await _getTokenPreference();

    try {
      response = await dio.get(
        'transaction?id=1',
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );

      return Transaction.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response.data["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }

  @override
  Future<String> postCheckout({
    String foodId,
    String quantity,
    double total,
    String status,
  }) async {
    String token = await _getTokenPreference();

    try {
      response = await dio.post(
        'checkout',
        data: {
          "food_id": foodId,
          "user_id": '1767',
          "quantity": quantity,
          "total": total,
          "status": status,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );

      return response.data["meta"]["message"];
    } on DioError catch (e) {
      throw e.response.data["meta"]["message"];
    } catch (error, stacktrace) {
      throw _showException(error, stacktrace);
    }
  }
}
