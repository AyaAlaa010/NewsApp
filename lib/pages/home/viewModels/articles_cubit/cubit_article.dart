
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home/viewModels/articles_cubit/stats_article.dart';

import '../../../../models/articles_model.dart';
import '../../../../network/ApiManager.dart';




class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(LoadingStatesArticles());

    getDataArticles(String sourceId) async {
    try {
      emit(LoadingStatesArticles());
      List<ArticlesModel> articlesList =
          await ApiManager.fetchDataArticles(sourceId);
      emit(SuccessStatesArticles(articlesList));
    } catch (errorMessage) {
      emit(ErrorStatesArticles(errorMessage.toString()));
    }
  }
}
