import 'package:flutter/material.dart';

class CustomBottomRow extends StatelessWidget {
  const CustomBottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(Icons.favorite_border, color: Colors.grey),
            SizedBox(width: 4),
            Text("6.7k"),
          ],
        ),
        Row(
          children: [
            Icon(Icons.chat_bubble_outline, color: Colors.grey),
            SizedBox(width: 4),
            Text("12k"),
          ],
        ),
        Row(
          children: [
            Icon(Icons.share, color: Colors.grey),
            SizedBox(width: 4),
            Text("5k"),
          ],
        ),
      ],
    );
  }
}
