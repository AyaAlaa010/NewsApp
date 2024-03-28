import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home/viewModels/articles_cubit/cubit_article.dart';
import 'package:news_app/pages/home/widgets/article_list_widget.dart';

import '../../../data/models/source_model.dart';
import 'tab_item_widget.dart';

class NewsListView extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListView({super.key, required this.sourcesList});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  int selectedIndex = 0;
  var viewModelsArticles=ArticlesCubit();
  @override
  void initState() {
    viewModelsArticles.getDataArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:
        (context)=> viewModelsArticles,
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(

          length: widget.sourcesList.length,
          child: TabBar(
            tabs: widget.sourcesList
                .map((e) => TabItemWidget(
                      sourceModel: e,
                      isSelected:
                          widget.sourcesList.indexOf(e) == selectedIndex,
                    ))
                .toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                viewModelsArticles.getDataArticles(widget.sourcesList[selectedIndex].id);
    });
            },
            labelPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
          ),
        ),
        ArticleListWidget(sourceId: widget.sourcesList[selectedIndex].id)
      ],
    ));
  }
}
