import 'package:news_app/data/models/source_model.dart';

abstract class SourcesRepository{

  Future<List<SourceModel>> fetchDataSources( String sourceId);


}