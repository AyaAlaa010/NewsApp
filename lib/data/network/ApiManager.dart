
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/articles_model.dart';

import '../../core/config/constants.dart';
import '../models/source_model.dart';



class ApiManager{

  Future<List<SourceModel>> fetchDataSource(String dataSourceId) async {
    List <SourceModel>  dataSourcesList=[];

    Map<String,dynamic> queryParams={"apiKey":Constants.API_KEY,"category":dataSourceId};

    Uri url=Uri.https( Constants.BASE_URL,"/v2/top-headlines/sources",queryParams);

  var response= await http.get(url);


    if(response.statusCode==200){
      print(response.body.toString());
      var data =jsonDecode(response.body);
      var dataSourcesjson=data["sources"];
      for(var element in dataSourcesjson){
        dataSourcesList.add(SourceModel.fromJson(element));
      }
      return dataSourcesList;
    }
    else{
      throw Exception("failed to load sources");
    }


  }

  
   Future<List<ArticlesModel>> fetchDataArticles(String sourceId) async{

   List<ArticlesModel> articlesList=[];
    Map<String, dynamic> queryParams={"apiKey":Constants.API_KEY,"sources":sourceId};

    Uri uri=Uri.https(Constants.BASE_URL,"/v2/everything",queryParams);
    var response= await http.get(uri);

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
       var   jsonArticlesList= data["articles"];


       for(var element in jsonArticlesList){
         articlesList.add(ArticlesModel.fromJson(element));
       }
       return articlesList;

    }else{
      throw Exception("data not fetched");
    }











   
   
  }


}