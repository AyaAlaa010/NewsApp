import 'package:news_app/data/data_sources/articles_data_source/articles_data_source.dart';
import 'package:news_app/data/network/ApiManager.dart';
import 'package:news_app/models/articles_model.dart';

class ArticlesDataSourceImpl implements ArticlesDataSource {
  ApiManager apiManager;

  ArticlesDataSourceImpl(this.apiManager);

  @override
  Future<List<ArticlesModel>> fetchArticles(String sourceId) async {
    return await apiManager.fetchDataArticles(sourceId);
  }
}
