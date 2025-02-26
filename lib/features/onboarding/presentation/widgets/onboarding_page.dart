import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/recipe_elevated_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C0F0D),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C0F0D),
        leadingWidth: 90,
        leading: Center(
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/myassets/back.svg",
              fit: BoxFit.none,
            ),
          ),
        ),
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/myassets/categories.png",
              width: 356,
              height: 557,
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              maxLines: 3,
              "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 150,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RecipeElevatedButton(
                  callback: () => context.go('/login'), text: "I'm New"),
              RecipeElevatedButton(
                  callback: () => context.go('/login'), text: "I've Been Here"),
            ],
          ),
        ),
      ),
    );
  }
}