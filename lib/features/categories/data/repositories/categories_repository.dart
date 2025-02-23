import 'package:recipe_app/core/client.dart';

import '../models/categories_model.dart';

class CategoriesRepository{
  CategoriesRepository({required this.client});

  final ApiClient client;

  List<CategoriesModel> categories = [];

  Future<List<CategoriesModel>> fetchCategories()async{
    if(categories.isNotEmpty) return categories;
    List<dynamic> rawCategories = await client.fetchCategories();
    categories = rawCategories.map((data) => CategoriesModel.fromJson(data)).toList();
    return categories;
  }
}