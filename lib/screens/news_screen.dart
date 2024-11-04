import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "asd",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  "Feb 28, 2023",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(width: 10),
                Text(
                  "• World",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/tornado_damage.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Damage of tornadoes",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 16),
            const Text(
              "sad",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
