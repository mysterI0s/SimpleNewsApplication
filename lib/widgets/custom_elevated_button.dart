import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4A90E2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100000000.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 40.0,
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
