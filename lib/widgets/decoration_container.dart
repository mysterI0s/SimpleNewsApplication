import 'package:flutter/material.dart';

class DecorationContainer extends StatelessWidget {
  const DecorationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
