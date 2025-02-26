import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/widgets/recipe_elevated_button2.dart';
import 'package:recipe_app/features/auth/presentation/manager/complete_profile_view_model.dart';
import 'package:recipe_app/features/auth/presentation/widgets/complete_profile_desc.dart';
import 'package:recipe_app/features/auth/presentation/widgets/profile_picker.dart';
import 'package:recipe_app/features/auth/presentation/widgets/recipe_bio_field.dart';
import 'package:recipe_app/features/auth/presentation/widgets/recipe_gender_field.dart';

class CompleteYourProfileView extends StatelessWidget {
  const CompleteYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompleteProfileViewModel(repo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                spacing: 10,
                children: [
                  CompleteProfileDesc(),
                  SizedBox(height: 10),
                  ProfilePicker(),
                  RecipeGenderField(),
                  RecipeBioField(),
                  SizedBox(height: 140),
                  RecipeElevatedButton2(
                    size: Size(207, 45),
                    text: "Continue",
                    callback: () async{
                      await context.read<CompleteProfileViewModel>().completeProfile();
                    },
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    backgroundColor: AppColors.redPinkMain,
                    foregroundColor: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}