class OnboardingModel {
  int id;
  String title, subtitle, picture;
  int order;

  OnboardingModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.order,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      order: json['order'],
    );
  }
}
