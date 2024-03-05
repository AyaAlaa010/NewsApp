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
    )


    )


  );


}