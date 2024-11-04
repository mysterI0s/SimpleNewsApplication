import 'package:new_project/models/news_model.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {
  final int loadingButtonIndex;
  NewsLoadingState(this.loadingButtonIndex);
}

class NewsSuccessState extends NewsState {
  NewsModel newsModel;
  NewsSuccessState(this.newsModel);
}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState(this.errorMessage);
}
