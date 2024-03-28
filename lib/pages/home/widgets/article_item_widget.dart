import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_colors.dart';

import '../../../core/config/constants.dart';
import '../../../data/models/articles_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticlesModel articlesModel;
  const ArticleItemWidget({super.key, required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade100
            ),
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) {
               return  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade100,
                    image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                  ),
                );

              },
              imageUrl: articlesModel.urlToImage,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          const SizedBox(height: 8,),
          Text(articlesModel.source.name, style: Constants.theme.textTheme.labelLarge!.copyWith(color: Colors.black45),)
          ,const SizedBox(height: 4,),
          Text(articlesModel.title,style: Constants.theme.textTheme.bodyMedium!.copyWith(color:Colors.black,height: 1.1))

        ],
      ),
    );
  }
}
