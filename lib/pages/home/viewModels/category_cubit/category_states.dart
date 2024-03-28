
import '../../../../data/models/source_model.dart';

sealed class CategoryStates {}

class LoadingCategoryState extends CategoryStates {}

class SuccessCategoryState extends CategoryStates {
  List<SourceModel> sourcesList;

  SuccessCategoryState(this.sourcesList);
}

class ErrorCategoryState extends CategoryStates {
  String? error;
  ErrorCategoryState(this.error);
}
