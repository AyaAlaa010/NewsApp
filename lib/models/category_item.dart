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

  //business entertainment general health science sports technology

  static List<CategoryItem> getCategoriesList() => [
    CategoryItem(id: "sports", categoryName: "Sports", backgroundColor:AppColors.red, categoryImage: "assets/images/sports.png"),
    CategoryItem(id: "general", categoryName: "Politics", backgroundColor:AppColors.darkBlue, categoryImage: "assets/images/Politics.png"),
    CategoryItem(id: "health", categoryName: "Health", backgroundColor:AppColors.bink, categoryImage: "assets/images/health.png"),
    CategoryItem(id: "business ", categoryName: "business ", backgroundColor:AppColors.brown, categoryImage: "assets/images/business.png"),
    CategoryItem(id: "environment", categoryName: "Environment", backgroundColor:AppColors.blue, categoryImage: "assets/images/environment.png"),
    CategoryItem(id: "science", categoryName: "Science", backgroundColor:AppColors.yellow, categoryImage: "assets/images/science.png")

  ];





}
