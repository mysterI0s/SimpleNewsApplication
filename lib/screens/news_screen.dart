import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/date_formatter.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/models/news_model.dart';
import 'package:new_project/styles/text_styles.dart';
import 'package:new_project/widgets/widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.share,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.save,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, NewsState state) {
          if (state is NewsSuccessState) {
            final NewsModel news = state.newsModel;

            return Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                news.source,
                                style: TextStyles.topBarTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                formatDate(news.publishedAt),
                                style: TextStyles.topBarTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                news.author,
                                style: TextStyles.topBarTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            news.title,
                            style: TextStyles.titleStyle,
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: NetworkImage(news.imageUrl!),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            news.description!,
                            style: TextStyles.descriptionStyle,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            news.content!,
                            style: TextStyles.descriptionStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomBottomRow(),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
