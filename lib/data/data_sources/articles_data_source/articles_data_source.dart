import 'package:news_app/models/articles_model.dart';

abstract class ArticlesDataSource {
  Future<List<ArticlesModel>> fetchArticles(String sourceId);
}
