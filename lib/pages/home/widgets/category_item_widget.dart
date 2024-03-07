import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/category_item.dart';

class CategoryItemWidget extends StatelessWidget {

  final CategoryItem categoryItem;
  final Function onCategoryClick;
  final int index;
  const CategoryItemWidget({super.key,required this.categoryItem,required this.index,required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        onCategoryClick(categoryItem);
        },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: categoryItem.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight:const Radius.circular(25),
            topLeft: const Radius.circular(25),
            bottomRight: index%2==0 ?const Radius.circular(25):Radius.zero,
            bottomLeft:  index%2!=0 ?const Radius.circular(25):Radius.zero,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryItem.categoryImage,fit:  BoxFit.cover,),
            Text(categoryItem.categoryName,style: Constants.theme.textTheme.bodyMedium,)
          ],
        ),





      ),
    );
  }
}
