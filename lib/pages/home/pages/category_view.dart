import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_colors.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/models/category_item.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/ApiManager.dart';

import '../../../core/config/constants.dart';
import '../widgets/tab_item_widget.dart';
class CategoryView extends StatelessWidget {

  final CategoryItem categoryItem;
  const CategoryView({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        //  DefaultTabController(length: 4, child: TabBar(tabs: [
        //   TabItemWidget(),
        //   TabItemWidget(),
        //   TabItemWidget(),
        //   TabItemWidget(),
        // ],)),
        FutureBuilder(future: ApiManager.fetchDataSource(categoryItem.id), builder: (context,snapshot){

          if(snapshot.hasError){
            print("error "+snapshot.error.toString());
               Center(
                 child: Text("some thing went wrong",
                               style:
                               Constants.theme.textTheme.bodyMedium!.copyWith(color:  AppColors.darkText),),
               );}
          else if(snapshot.connectionState==ConnectionState.waiting){
            print("waiting ");

            return  const Center(
              child: CircularProgressIndicator(),
            );
          }
            List<SourceModel> sourcesList=snapshot.data ??[];
          print("data ${snapshot.data!.length}  ${snapshot.data}");

          return Expanded(
            child: ListView.builder(itemBuilder: (context,index){
               return Text(sourcesList[index].name,style:Constants.theme.textTheme.bodySmall!.copyWith(color: Colors.black)  ,);
              }
              ,itemCount: sourcesList.length,
              ),
          );


        }),

      ],

    );
  }
}
