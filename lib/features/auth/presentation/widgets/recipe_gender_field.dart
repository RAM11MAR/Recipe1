import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';

import '../manager/complete_profile_view_model.dart';

class RecipeGenderField extends StatelessWidget {
  const RecipeGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CompleteProfileViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final result = await showModalBottomSheet<String>(
              context: context,
              useRootNavigator: false,
              builder: (context) => Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop("Male"),
                      child: Text(
                        "Male",
                        style: TextStyle(
                          color: AppColors.beigeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop("Female"),
                      child: Text(
                        "Female",
                        style: TextStyle(
                          color: AppColors.beigeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            vm.gender=result;
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 8,
            ),
            width: 358,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              vm.gender == null ? "Male/Female" : vm.gender!,
              style: TextStyle(
                color: AppColors.beigeColor.withValues(
                  alpha: vm.gender == null ? 0.5 : 1,
                ),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}