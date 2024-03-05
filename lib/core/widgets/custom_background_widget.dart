import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {

   Widget ? child;
    CustomBackgroundWidget({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment:  Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset("assets/images/pattern.png").image,fit: BoxFit.cover),
        color: Colors.white
      ),
      child: child,
    );
  }
}
