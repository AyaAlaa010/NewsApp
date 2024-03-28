import 'package:news_app/data/data_sources/sources_data_source/sources_data_source.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/data/repositories/sources_repository.dart';

class SourcesRepositoryImp  implements SourcesRepository{
  SourcesDataSource sourcesDataSource;

  SourcesRepositoryImp(this.sourcesDataSource);



  @override
  Future<List<SourceModel>> fetchDataSources(String sourceId) async {
    return await  sourcesDataSource.fetchSources(sourceId);
  }



}