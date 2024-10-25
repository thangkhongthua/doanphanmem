import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget{
  const IntroContent({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text('Food Market',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
            ),
            Text(
              
              'Order delicious and quality food here!',
              style: TextStyle(
                fontSize: 11,
                color:Colors.white,
              ),
            )
        ],
    );
  }
  
}