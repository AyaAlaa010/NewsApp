import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/pages/custom_drawer.dart';
import 'package:news_app/pages/home/category_item.dart';

import '../widgets/category_item_widget.dart';

class HomeView extends StatelessWidget {
  List<CategoryItem>categoriesList=CategoryItem.getCategoriesList();
   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(child: Scaffold(
      appBar: AppBar(elevation: 20,title:  Text("News App",textAlign: TextAlign.center,
          style: Constants.theme.textTheme.bodyMedium)
      ),
      drawer:const  CustomDrawer(),
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Pick your category \n of interest",
              style: Constants.theme.textTheme.bodyLarge!.copyWith(height: 1.15)
              ,textAlign: TextAlign.start,),
             const SizedBox(height: 10,),
             Expanded(
               child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 8/9),
                  itemBuilder: (context,index){
                return CategoryItemWidget( categoryItem:categoriesList[index],index:index);
               
                           },itemCount: categoriesList.length,),
             )
          ],

        ),
      ),


    ),);
  }
}
