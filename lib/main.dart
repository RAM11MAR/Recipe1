import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/data/repository/auth_repository.dart';
import 'package:recipe_app/features/auth/presentation/pages/login_view.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_up_view.dart';

import 'features/categories/data/repositories/categories_repository.dart';
import 'features/categories/presentation/pages/categories_view.dart';
import 'features/categories/presentation/pages/categories_view_model.dart';
import 'features/onboarding/data/repositories/onboarding_repository.dart';
import 'features/onboarding/presentation/pages/onboarding_view.dart';
import 'features/onboarding/presentation/pages/onboarding_view_model.dart';
import 'features/profile/data/repositories/profile_repository.dart';
import 'features/profile/presentation/pages/profile_view.dart';
import 'features/profile/presentation/pages/profile_view_model.dart';
void main() => runApp(RecipeApp());

GoRouter router = GoRouter(
  initialLocation: '/signUp',
  routes: [
    GoRoute(path: '/onboarding', builder: (context, state) => OnboardingView(viewModel: OnboardingViewModel(repo: OnboardingRepository(client: ApiClient())))),
    GoRoute(path: '/profile', builder: (context, state) => ProfileView(viewModel: ProfileViewModel(repo: ProfileRepository(client: ApiClient())))),
    GoRoute(path: '/login', builder: (context, state) => LoginView()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpView()),
    GoRoute(path: '/categories',builder: (context, state) => CategoriesView(vm: CategoriesViewModel(repo: CategoriesRepository(client: ApiClient())))),
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(create: (context) => AuthRepository(client: context.read())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routerConfig: router,
      ),
    );
  }
}
