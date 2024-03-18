import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_colors.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/models/category_item.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/ApiManager.dart';
import 'package:news_app/pages/home/widgets/news_list_view.dart';

import '../../../core/config/constants.dart';
import '../widgets/tab_item_widget.dart';

class CategoryView extends StatelessWidget {
  final CategoryItem categoryItem;
  const CategoryView({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.fetchDataSource(categoryItem.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(
                "some thing went wrong",
                style: Constants.theme.textTheme.bodyMedium!
                    .copyWith(color: AppColors.darkText),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<SourceModel> sourcesList = snapshot.data ?? [];

          return NewsListView(sourcesList: sourcesList);
        });
  }
}
