
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/source_model.dart';

import '../core/config/constants.dart';

class ApiManager{

 static Future<List<SourceModel>> fetchDataSource(String dataSourceId) async {
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



}