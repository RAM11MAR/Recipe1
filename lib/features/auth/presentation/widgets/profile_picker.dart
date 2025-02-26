import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/auth/presentation/manager/complete_profile_view_model.dart';

class ProfilePicker extends StatelessWidget {
  const ProfilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    var file = context.select((CompleteProfileViewModel vm) => vm.file);
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(50),
              ),
              child: file == null
                  ? Image.asset("assets/myassets/profile.png")
                  : ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(
                  file,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () async {
                  await context.read<CompleteProfileViewModel>().pickImage(ImageSource.camera);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.redPinkMain,
                  ),
                  child: SvgPicture.asset(
                    "assets/myassets/edit.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}