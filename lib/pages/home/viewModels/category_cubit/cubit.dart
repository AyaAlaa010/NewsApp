import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/source_model.dart';
import '../../../../data/network/ApiManager.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(LoadingCategoryState());

  getDataSource(String dataSourceId) async {
    try {
      emit(LoadingCategoryState());
      List<SourceModel> sourcesList =
          await ApiManager.fetchDataSource(dataSourceId);
      emit(SuccessCategoryState(sourcesList));
    } catch (error) {
      emit(ErrorCategoryState(error.toString()));
    }
  }
}
