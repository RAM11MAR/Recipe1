import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/repository/auth_repository.dart';
import '../../../../core/widgets/recipe_elevated_button2.dart';
import '../manager/login_view_model.dart';
import '../widgets/login_view_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        repo: context.read<AuthRepository>(),
      ),
      builder: (context, recipeButton) {
        final vm = context.watch<LoginViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Login"),
          ),
          body: ListView(
            padding: EdgeInsets.only(top: 150),
            children: [
              const LoginViewForm(),
              if (vm.hasError)
                Text(
                  vm.errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              SizedBox(height: 90),
              RecipeElevatedButton2(
                text: "Login",
                fontSize: 20,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.login() && context.mounted) {
                      context.go('/categories');
                    }
                  }
                },
                size: Size(207, 45),
              ),
              SizedBox(height: 27),
              RecipeElevatedButton2(
                text: "Sign Up",
                fontSize: 20,
                callback: () => context.go('signUp'),
                size: Size(207, 45),
              ),
            ],
          ),
        );
      },
    );
  }
}