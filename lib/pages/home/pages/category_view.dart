import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/config/app_colors.dart';

import 'package:news_app/pages/home/widgets/news_list_view.dart';

import '../../../core/config/constants.dart';
import '../../../data/models/category_item.dart';
import '../viewModels/category_cubit/category_states.dart';
import '../viewModels/category_cubit/cubit.dart';


class CategoryView extends StatefulWidget {
  final CategoryItem categoryItem;
  const CategoryView({super.key, required this.categoryItem});

  @override
  State<CategoryView> createState() => _CategoryViewState();




}

class _CategoryViewState extends State<CategoryView> {
  var cubitViewModel=CategoryCubit();

  @override
  void initState() {
    cubitViewModel.getDataSource(widget.categoryItem.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(bloc: cubitViewModel,
        builder: (context, state) {
      switch (state) {
        case LoadingCategoryState():
          return const Center(child:  CircularProgressIndicator());
        case SuccessCategoryState():
          return NewsListView(sourcesList: state.sourcesList);
        case ErrorCategoryState():
          return Center(
            child: Text(
              state.error.toString(),
              style: Constants.theme.textTheme.bodyMedium!
                  .copyWith(color: AppColors.darkText),
            ),
          );
      }
    });
  }
}
// FutureBuilder(
//   future: ApiManager.fetchDataSource(categoryItem.id),
//   builder: (context, snapshot) {
//     if (snapshot.hasError) {
//       Center(
//         child: Text(
//           "some thing went wrong",
//           style: Constants.theme.textTheme.bodyMedium!
//               .copyWith(color: AppColors.darkText),
//         ),
//       );
//     } else if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     List<SourceModel> sourcesList = snapshot.data ?? [];
//
//     return NewsListView(sourcesList: sourcesList);
//   });
