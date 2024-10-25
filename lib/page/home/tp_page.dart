import 'package:flutter/material.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/confirm_page.dart';
import 'package:food_market/page/home/home_page.dart';
import 'package:food_market/page/home/signIn_page.dart';
import 'package:food_market/page/home/widgets/bottom_card.dart';

class TPPage extends StatelessWidget {
  String account;
 TPPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    // final databaseReference = FirebaseDatabase.instance.ref('Account').child(account).child('Cart').remove();
    
    return Scaffold(
      body: Container(alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ 
          const Text('Đơn hàng của bạn đang được xác nhận và sẽ được giao hàng đến nơi trong thời gian sớm nhất',
        textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), ),
        const SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
          

            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage(account: '', items: [],)),
  );
          },
          child:Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red
            ),
            
            child: const Text('Quay về trang chủ'),

          ),
        ),
        ]
      ),
      )
      
    );
  }
}