import 'package:flutter/material.dart';

class ButtonWidget2 extends StatelessWidget {
  const ButtonWidget2({
    required this.onPressed,
    required this.text,
    required this.style,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final TextStyle style;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
            fit: BoxFit.cover,
          ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
