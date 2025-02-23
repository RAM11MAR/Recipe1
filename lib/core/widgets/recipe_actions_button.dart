import 'package:flutter/material.dart';

class RecipeActionsButton extends StatelessWidget {
  const RecipeActionsButton({
    super.key,
    required this.image,
    required this.callback,
  });

  final String image;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Color(0xFFFFC6C9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        onPressed: callback,
        icon: Image.asset(
          image,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
