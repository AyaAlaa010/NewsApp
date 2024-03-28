import 'package:news_app/data/data_sources/sources_data_source/sources_data_source.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/data/network/ApiManager.dart';

class  SourcesDataSourceIMP implements SourcesDataSource {
  ApiManager apiManager;
  SourcesDataSourceIMP(this.apiManager);



  @override
  Future<List<SourceModel>> fetchSources(String sourceId)  async{
    return await  apiManager.fetchDataSource(sourceId);
  }

}