import 'package:flutter/material.dart';

import 'app_colors.dart';

class ApplicationThemeManager{


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:  Radius.circular(30)))
      ,iconTheme: IconThemeData(
        size: 35,
        color: Colors.white
    ),


    ),
    textTheme: const TextTheme(
      titleLarge:  TextStyle(
        fontFamily: "Exo",fontSize: 24,
        fontWeight: FontWeight.w700,
          color: Colors.white
      ),
      bodyLarge: TextStyle(
          fontFamily: "Exo",fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.darkText,

      )
        ,
        bodyMedium: TextStyle(
            fontFamily: "Exo",fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white
        ),
        bodySmall: TextStyle(
            fontFamily: "Exo",fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white
        ),
        displayLarge: TextStyle(
            fontFamily: "Exo",fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.darkText
        )

    ),



  );


}