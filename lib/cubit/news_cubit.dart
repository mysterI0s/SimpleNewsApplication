import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/server_manager.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/models/news_model.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  ServerManager serverManager = ServerManager();

  Future getNewsData() async {
    emit(NewsLoadingState());
    try {
      List<NewsModel> breakingNewsList = await serverManager.getNews();
      emit(NewsSuccessState(breakingNewsList));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }
}
