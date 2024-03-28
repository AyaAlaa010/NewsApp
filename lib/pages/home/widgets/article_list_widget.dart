import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/app_colors.dart';
import 'package:news_app/pages/home/viewModels/articles_cubit/cubit_article.dart';

import '../../../core/config/constants.dart';
import '../viewModels/articles_cubit/stats_article.dart';
import 'article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  final String sourceId;
  const ArticleListWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesStates>(
        builder: (context, states) {
      switch (states) {
        case LoadingStatesArticles():
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        case SuccessStatesArticles():
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ArticleItemWidget(
                    articlesModel: states.articlesList[index]);
              },
              itemCount: states.articlesList.length,
            ),
          );

        case ErrorStatesArticles():
          return Center(
              child: Text(
            states.errorMessage.toString(),
            style: Constants.theme.textTheme.bodyMedium!
                .copyWith(color: Colors.black),
          ));
      }

    });

    // FutureBuilder(
    //   future: ApiManager.fetchDataArticles(sourceId),
    //   builder: (context, snapshots) {
    //     if (snapshots.hasError) {
    //       return Center(
    //           child: Text(
    //         "Some thing went wrong !!",
    //         style: Constants.theme.textTheme.bodyMedium!
    //             .copyWith(color: Colors.black),
    //       ));
    //     }
    //
    //     if (snapshots.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.primaryColor,
    //         ),
    //       );
    //     }
    //
    //     List<ArticlesModel> articlesList = snapshots.data ?? [];
    //
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) {
    //           return ArticleItemWidget(articlesModel: articlesList[index]);
    //         },
    //         itemCount: articlesList.length,
    //       ),
    //     );
    //   });
  }
}
