import 'package:recipe_app/core/client.dart';

import '../models/onboarding_model.dart';

class OnboardingRepository {
  final ApiClient client;

  OnboardingRepository({required this.client});

  List<OnboardingModel> onboardings = [];

  Future<List<OnboardingModel>> getOnboarding() async {
    if (onboardings.isNotEmpty) return onboardings;
    final rawPages = await client.fetchOnboarding();
    onboardings = rawPages.map((data) => OnboardingModel.fromJson(data)).toList();
    return onboardings;
  }
}
