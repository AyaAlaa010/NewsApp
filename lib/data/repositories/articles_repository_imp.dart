import 'package:news_app/data/data_sources/articles_data_source/articles_data_source.dart';
import 'package:news_app/data/repositories/articles_repository.dart';
import 'package:news_app/models/articles_model.dart';

class ArticlesRepositoryImp implements ArticlesRepository{

  ArticlesDataSource articlesDataSource;

  ArticlesRepositoryImp(this.articlesDataSource);
  @override
  Future<List<ArticlesModel>> fetchArticles(String sourceId) async{
    return await articlesDataSource.fetchArticles(sourceId);

  }




}