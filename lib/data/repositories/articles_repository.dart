import 'package:news_app/models/articles_model.dart';

abstract class ArticlesRepository {
  Future<List<ArticlesModel>> fetchArticles(String sourceId);
}
