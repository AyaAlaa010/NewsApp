
import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/ApiManager.dart';

class CategoryViewModel extends ChangeNotifier {
  List<SourceModel> _sourcesList = [];
  List<SourceModel> get sourcesList => _sourcesList;

  getDataSource(String sourceId) async {
    try {
      _sourcesList = await ApiManager.fetchDataSource(sourceId);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
