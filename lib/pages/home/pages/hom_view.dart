import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/main.dart';
import 'package:news_app/pages/custom_drawer.dart';
import 'package:news_app/pages/home/category_item.dart';
import 'package:news_app/pages/home/pages/category_view.dart';
import '../widgets/category_item_widget.dart';

class HomeView extends StatefulWidget {

   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem>categoriesList=CategoryItem.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(child: Scaffold(
      appBar: AppBar(elevation: 20,leadingWidth:80, actions:  [
        if(selectedCategory!=null )  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),child: IconButton(
            onPressed:(){},
            icon: const Icon(Icons.search,color: Colors.white,size: 45,)))
      ],title:  Text( selectedCategory!=null? selectedCategory!.categoryName : "News App",textAlign: TextAlign.center,
          style: Constants.theme.textTheme.bodyMedium)
      ),
      drawer: CustomDrawer(onCategoriesDrawerClick: onCategoriesDrawerClick),
      body:  selectedCategory!=null ?
      CategoryView(categoryItem: selectedCategory!):Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Pick your category \n of interest",
              style: Constants.theme.textTheme.bodyLarge!.copyWith(height: 1.15)
              ,textAlign: TextAlign.start,),
            const SizedBox(height: 15,),
            Expanded(
              child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 4/5),
                itemBuilder: (context,index){
                  return CategoryItemWidget( categoryItem:categoriesList[index],index:index,onCategoryClick: onCategoryClick,);

                },itemCount: categoriesList.length,),
            )
          ],

        ),
      ),

    ),);
  }

  CategoryItem ? selectedCategory;

  void onCategoryClick(CategoryItem categoryItem){

    setState(() {
      selectedCategory=categoryItem;

    });
    print("--------${categoryItem.id}");

  }


  void onCategoriesDrawerClick(){
    setState(() {
      selectedCategory=null;
      navigatorKey.currentState!.pop();
    });
  }
}
