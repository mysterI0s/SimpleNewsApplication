import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/models/news_model.dart';
import 'package:new_project/screens/screens.dart';
import 'package:new_project/widgets/widgets.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, NewsState state) {
          if (state is NewsSuccessState) {
            final List<NewsModel> newsList = state.newsList;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: newsList.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 4),
                        itemBuilder: (context, index) {
                          final news = newsList[index];
                          return BreakingNewsCard(
                            newsModel: news,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsScreen(
                                    newsModel: news,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: newsList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                      itemBuilder: (context, index) {
                        final news = newsList[index];
                        return RecommendedNewsCard(
                          newsModel: news,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsScreen(
                                  newsModel: news,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "No data available",
              ),
            );
          }
        },
      ),
    ));
  }
}
