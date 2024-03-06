import 'package:flutter/cupertino.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/pages/home/category_item.dart';

class CategoryItemWidget extends StatelessWidget {

  final CategoryItem categoryItem;
  final int index;
  const CategoryItemWidget({super.key,required this.categoryItem,required this.index});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Image.asset(categoryItem.categoryImage,fit:  BoxFit.cover,)),
          Expanded(child: Text(categoryItem.categoryName,style: Constants.theme.textTheme.bodyMedium,))
        ],
      ),





    );
  }
}
