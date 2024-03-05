
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/pages/settings/pages/settings_view.dart';
import 'package:news_app/pages/splash/pages/spash_view.dart';

import '../../pages/home/pages/hom_view.dart';

class Routes{

static Route <dynamic> onGenerateRouteSettings( RouteSettings settings){

  switch(settings.name){
    case PageRouteName.initial: return MaterialPageRoute(builder: (context)=> SplashView(),settings: settings);
    case PageRouteName.homeView: return MaterialPageRoute(builder: (context)=> HomeView(),settings: settings);
    case PageRouteName.settingsView:return MaterialPageRoute(builder: (context)=> SettingsView(),settings: settings);
    default: return MaterialPageRoute(builder: (context)=> SplashView(),settings: settings);

  }


}


}