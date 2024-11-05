import 'package:new_project/models/news_model.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {
  NewsLoadingState();
}

class NewsSuccessState extends NewsState {
  List<NewsModel> newsList;
  NewsSuccessState(this.newsList);
}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState(this.errorMessage);
}
