import 'package:news_app/data/models/source_model.dart';

abstract class SourcesDataSource{
   Future<List<SourceModel>> fetchSources(String sourceId);
}