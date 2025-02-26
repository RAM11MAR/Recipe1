import 'package:flutter/material.dart';

class CompleteProfileDesc extends StatelessWidget {
  const CompleteProfileDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          "Complete Your Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
          ),
        ),
        Text(
          maxLines: 3,
          "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}