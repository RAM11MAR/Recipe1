import 'package:flutter/material.dart';

class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    required this.callback,
    required this.text,
  });

  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFFFFC6C9),
        backgroundColor: Color(0xFFFFC6C9),
        fixedSize: Size(207, 45),
        elevation: 0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFFEC888D),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
