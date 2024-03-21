import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_colors.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/models/category_item.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/ApiManager.dart';
import 'package:news_app/pages/home/widgets/news_list_view.dart';
import 'package:provider/provider.dart';

import '../../../core/config/constants.dart';
import '../viewModels/categoryViewModels.dart';
import '../widgets/tab_item_widget.dart';

class CategoryView extends StatefulWidget {
  final CategoryItem categoryItem;
  const CategoryView({super.key, required this.categoryItem});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryViewModel categoryViewModel =CategoryViewModel();
  @override
  void initState() {
    categoryViewModel.getDataSource(widget.categoryItem.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (Context)=> categoryViewModel,
      child: Consumer<CategoryViewModel>(builder: (context, vm, _)  {
         if(vm.sourcesList.isEmpty){
         return   const Center(
                     child: CircularProgressIndicator(),
                   );
         }
         else {  return   NewsListView(sourcesList: vm.sourcesList);}


      },),

    );


      // FutureBuilder(
      //   future: ApiManager.fetchDataSource(widget.categoryItem.id),
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
  }
}
