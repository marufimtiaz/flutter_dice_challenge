import 'package:flutter/material.dart';

class DiceWithButton extends StatelessWidget {
  const DiceWithButton(
      {super.key, required this.image, required this.onPressed});
  final String image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            boxShadow: [
              BoxShadow(
                color: Colors.red.shade900,
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Image.asset(image),
        ));
  }
}
