
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/data_sources/articles_data_source/articles_data_source.dart';
import 'package:news_app/data/data_sources/articles_data_source/articles_data_sourceimp.dart';
import 'package:news_app/data/repositories/articles_repository.dart';
import 'package:news_app/data/repositories/articles_repository_imp.dart';
import 'package:news_app/pages/home/viewModels/articles_cubit/stats_article.dart';

import '../../../../data/network/ApiManager.dart';
import '../../../../models/articles_model.dart';




class ArticlesCubit extends Cubit<ArticlesStates> {


  ArticlesCubit() : super(LoadingStatesArticles());
  late ArticlesRepository articlesRepository;
  late ArticlesDataSource articlesDataSource;
  late ApiManager apiManager;

    getDataArticles(String sourceId) async {

      apiManager=ApiManager();
      articlesDataSource=ArticlesDataSourceImpl(apiManager);
      articlesRepository=ArticlesRepositoryImp(articlesDataSource);

    try {
      emit(LoadingStatesArticles());
      List<ArticlesModel> articlesList =
          await articlesRepository.fetchArticles(sourceId);
      emit(SuccessStatesArticles(articlesList));
    } catch (errorMessage) {
      emit(ErrorStatesArticles(errorMessage.toString()));
    }
  }
}
