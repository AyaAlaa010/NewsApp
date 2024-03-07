import 'package:flutter/cupertino.dart';
import 'package:news_app/core/config/app_colors.dart';

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.primaryColor
      ),


    );
  }
}
