import 'package:dio/dio.dart';

import '../features/auth/data/models/user_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://192.168.137.1:8888/api/v1"),
  );

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Login qilib bo'lmadi!");
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchOnboarding() async {
    var response = await dio.get("/onboarding/list");
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchProfileRecipes() async {
    var response = await dio.get("/recipes/list");
    List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(response.data);
    return data;
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    var responseProfile = await dio.get("/auth/details/1");
    return responseProfile.data;
  }
}
