import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/article_list_widget.dart';

import '../../../models/source_model.dart';
import 'tab_item_widget.dart';

class NewsListView extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListView({super.key, required this.sourcesList});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              });
            },
            labelPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
          ),
        ),
        ArticleListWidget(sourceId: widget.sourcesList[selectedIndex].id)
      ],
    );
  }
}
