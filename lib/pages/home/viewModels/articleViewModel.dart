import 'package:flutter/cupertino.dart';
import 'package:news_app/network/ApiManager.dart';
import 'package:provider/provider.dart';

import '../../../models/articles_model.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<ArticlesModel> _articlesList = [];
  List<ArticlesModel> get articlesList => _articlesList;

  getDataArticles(String sourceId) async {
    try {
      _articlesList = await ApiManager.fetchDataArticles(sourceId);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
