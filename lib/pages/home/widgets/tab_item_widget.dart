import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_colors.dart';
import 'package:news_app/models/source_model.dart';

import '../../../core/config/constants.dart';

class TabItemWidget extends StatelessWidget {
  final SourceModel sourceModel;
  final bool isSelected;
  const TabItemWidget({super.key, required this.sourceModel,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: AppColors.primaryColor,width: 2),
        color: isSelected ? AppColors.primaryColor: Colors.transparent,

      ),
      child: Text(sourceModel.name, style: Constants.theme.textTheme.bodyMedium!.copyWith(color: isSelected? Colors.white:AppColors.primaryColor ),),


    );
  }
}
