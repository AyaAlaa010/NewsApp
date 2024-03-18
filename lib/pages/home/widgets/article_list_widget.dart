import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_colors.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/network/ApiManager.dart';

import '../../../core/config/constants.dart';
import 'article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  final String sourceId;
  const ArticleListWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.fetchDataArticles(sourceId),
        builder: (context, snapshots) {
          if (snapshots.hasError) {
            return Center(
                child: Text(
              "Some thing went wrong !!",
              style: Constants.theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.black),
            ));
          }

          if (snapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }

          List<ArticlesModel> articlesList = snapshots.data ?? [];

          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ArticleItemWidget(articlesModel: articlesList[index]);
              },
              itemCount: articlesList.length,
            ),
          );
        });
  }
}
