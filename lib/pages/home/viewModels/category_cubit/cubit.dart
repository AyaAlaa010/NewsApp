import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/data_sources/sources_data_source/sources_data_source.dart';
import 'package:news_app/data/data_sources/sources_data_source/sources_data_sourceimp.dart';
import 'package:news_app/data/repositories/sources_repository.dart';
import 'package:news_app/data/repositories/sources_repository_imp.dart';
import '../../../../data/models/source_model.dart';
import '../../../../data/network/ApiManager.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(LoadingCategoryState());
  late SourcesRepository sourcesRepository;
  late SourcesDataSource sourcesDataSource;
  late ApiManager apiManager;

  getDataSource(String dataSourceId) async {
    apiManager=ApiManager();
    sourcesDataSource=SourcesDataSourceIMP(apiManager);
    sourcesRepository=SourcesRepositoryImp(sourcesDataSource);
    try {
      emit(LoadingCategoryState());
      List<SourceModel> sourcesList =
          await sourcesRepository.fetchDataSources(dataSourceId);
      emit(SuccessCategoryState(sourcesList));
    } catch (error) {
      emit(ErrorCategoryState(error.toString()));
    }
  }
}
