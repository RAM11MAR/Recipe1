import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar2 extends StatelessWidget {
  const BottomNavBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        clipBehavior: Clip.none,
        width: 281,
        height: 56,
        decoration: BoxDecoration(
          color: Color(0xFFFD5D69),
          borderRadius: BorderRadius.circular(33),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: SvgPicture.asset("assets/recipe/icon/home.svg"),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset("assets/recipe/icon/massages.svg"),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset("assets/recipe/icon/categories.svg"),
              onPressed: () => context.go('/categories'),
            ),
            IconButton(
              icon: SvgPicture.asset("assets/recipe/icon/profile.svg"),
              onPressed: () => context.go('/profile'),
            ),
          ],
        ),
      ),
    );
  }
}
