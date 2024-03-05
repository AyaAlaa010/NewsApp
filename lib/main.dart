import 'package:flutter/material.dart';
import 'package:news_app/core/config/application_theme_manager.dart';
import 'package:news_app/core/config/pages_route_name.dart';

import 'core/config/routes.dart';


GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApplication());
}



class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     theme: ApplicationThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.onGenerateRouteSettings,
      navigatorKey: navigatorKey,
    );
  }
}

