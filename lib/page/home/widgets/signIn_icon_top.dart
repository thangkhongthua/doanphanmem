import 'package:flutter/material.dart';

class SignInIcon extends StatelessWidget{
  const SignInIcon({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(left: size.width*0.1),
      width: size.width/1.2,
      height: size.height*0.4,
      alignment: Alignment.center,
      child: Image.asset('asset/images/icons/icon_register.png', fit: BoxFit.cover,
   
      ),
    );
  }
}