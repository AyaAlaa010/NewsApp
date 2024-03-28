

import '../../../../models/articles_model.dart';

sealed class ArticlesStates {}

class LoadingStatesArticles extends ArticlesStates {}

class SuccessStatesArticles extends ArticlesStates {
  List<ArticlesModel> articlesList;
  SuccessStatesArticles(this.articlesList);
}

class ErrorStatesArticles extends ArticlesStates {
  String? errorMessage;
  ErrorStatesArticles(this.errorMessage);
}
