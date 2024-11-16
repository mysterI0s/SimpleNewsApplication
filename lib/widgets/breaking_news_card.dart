import 'package:flutter/material.dart';
import 'package:new_project/models/news_model.dart';
import 'package:new_project/styles/text_styles.dart';

class BreakingNewsCard extends StatelessWidget {
  final NewsModel newsModel;
  final VoidCallback onTap;

  const BreakingNewsCard({
    super.key,
    required this.newsModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(newsModel.imageUrl!),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                newsModel.source,
                style: TextStyles.listItemStyle,
              ),
              const SizedBox(height: 8),
              Text(
                newsModel.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.listItemStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
