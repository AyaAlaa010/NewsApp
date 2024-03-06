import 'dart:ui';

import 'package:news_app/core/config/app_colors.dart';

class CategoryItem {
  final String id;
  final String categoryName;
  final Color backgroundColor;
  final String categoryImage;

   CategoryItem(
      {required this.id,
      required this.categoryName,
      required this.backgroundColor,
      required this.categoryImage});



  static List<CategoryItem> getCategoriesList() => [
    CategoryItem(id: "sport", categoryName: "Sports", backgroundColor:AppColors.red, categoryImage: "assets/images/sports.png"),
    CategoryItem(id: "Politics", categoryName: "Politics", backgroundColor:AppColors.darkBlue, categoryImage: "assets/images/Politics.png"),
    CategoryItem(id: "Health", categoryName: "Health", backgroundColor:AppColors.bink, categoryImage: "assets/images/health.png"),
    CategoryItem(id: "business ", categoryName: "business ", backgroundColor:AppColors.brown, categoryImage: "assets/images/business.png"),
    CategoryItem(id: "Environment", categoryName: "Environment", backgroundColor:AppColors.blue, categoryImage: "assets/images/environment.png"),
    CategoryItem(id: "Science", categoryName: "Science", backgroundColor:AppColors.yellow, categoryImage: "assets/images/science.png")

  ];





}
