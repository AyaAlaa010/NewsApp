import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import '../core/config/app_colors.dart';

class CustomDrawer extends StatelessWidget {

  final Function onCategoriesDrawerClick;

  const CustomDrawer({super.key, required this.onCategoriesDrawerClick});

  @override
  Widget build(BuildContext context) {
    return  Container(
       width: Constants.mediaQuery.width*0.8,
      color: Colors.white,
      child: Column(
        children: [

          Container(
            alignment: Alignment.center,
            height: 170,
            color: AppColors.primaryColor,
            width: Constants.mediaQuery.width*0.8 ,
            child:  Text("News App!",style: Constants.theme.textTheme.titleLarge,),
          ),
          const SizedBox(height: 25,),
          InkWell(
            onTap: (){onCategoriesDrawerClick();},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                 const Icon(Icons.list,size: 40,color: Colors.black,),
                  const SizedBox(width:10),
                  Text("Categories",style: Constants.theme.textTheme.titleLarge!.copyWith(color: AppColors.darkText),)
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){},
            child: Padding(
                padding:const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.settings,size: 40,color: Colors.black,),
                    const SizedBox(width:10),
                    Text( "Settings",style: Constants.theme.textTheme.titleLarge!.copyWith( color: AppColors.darkText),)
                  ],

                )),
          )

        ],
      ),




    );
  }
}
