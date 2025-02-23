class CategoriesModel {
  final int id;
  final String title, image;
  final bool main;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.main,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      main: json['main'],
    );
  }
}
