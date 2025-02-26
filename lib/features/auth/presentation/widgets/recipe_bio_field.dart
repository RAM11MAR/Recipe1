import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/auth/presentation/manager/complete_profile_view_model.dart';

class RecipeBioField extends StatelessWidget {
  const RecipeBioField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Gender",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: context.read<CompleteProfileViewModel>().bioController,
          maxLines: 5,
          minLines: 5,
          keyboardType: TextInputType.text,
          style: TextStyle(color: AppColors.beigeColor),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              filled: true,
              fillColor: AppColors.pink,
              hintText: "About Yourself",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              )
          ),
        ),
      ],
    );
  }
}