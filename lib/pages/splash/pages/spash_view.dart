import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/main.dart';
import '../../../core/widgets/custom_background_widget.dart';

class  SplashView extends StatefulWidget {
  const  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();

}


class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration( seconds: 2),
            ()=>navigatorKey.currentState!.pushReplacementNamed(PageRouteName.homeView) );

  }
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(child: Image.asset("assets/images/logo.png"),);
  }
}
