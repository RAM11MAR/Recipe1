import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/auth/presentation/widgets/recipe_password_form_field.dart';
import 'package:recipe_app/features/auth/presentation/widgets/recipe_text_form_field.dart';

import '../manager/login_view_model.dart';


class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginViewModel>();
    return Form(
      key: vm.formKey,
      child: Column(
        spacing: 10,
        children: [
          RecipeTextFormField(
            title: "Login",
            hintText: "example@gmail.com",
            validator: (value) => null,
            controller: vm.loginController,
          ),
          RecipePasswordFormField(
            title: "Password",
            controller: vm.passwordController,
            validator: (value) => null,
          ),
        ],
      ),
    );
  }
}
