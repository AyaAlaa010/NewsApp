import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(child: Scaffold(
      appBar: AppBar(elevation: 20,title: const Text("News App",textAlign: TextAlign.center,),
      ),
      drawer: Drawer(),
      body: Container(),


    ),);
  }
}
