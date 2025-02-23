import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/onboarding_model.dart';
import '../../data/repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel({required OnboardingRepository repo}): _repo = repo{fetchOnboardingData();}

  final PageController controller = PageController();

  final OnboardingRepository _repo;

  List<OnboardingModel> onboardingList = [];

  Future<void> fetchOnboardingData() async {
      onboardingList = await _repo.getOnboarding();
      notifyListeners();
  }
  void pageChangedCallBack(int index, BuildContext context) {
    if (index >= onboardingList.length){
      context.go('/');
    }
  }
}
