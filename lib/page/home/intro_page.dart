import 'package:flutter/material.dart';
import 'package:food_market/page/home/widgets/intro_bottom_button.dart';
import 'package:food_market/page/home/widgets/intro_content.dart';
import 'package:food_market/page/home/widgets/intro_icontop.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff574E6D),
              Color.fromARGB(255, 23, 20, 32),
            ]
          )
        ),
        child: const Column(
          children: [
            IntroIconTop(),
            IntroContent(),
            IntroBottom(),
          ],
        ),
      ),
    );
  }

}