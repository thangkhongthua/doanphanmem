import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/widgets/signIn_content.dart';
import 'package:food_market/page/home/widgets/signIn_icon_top.dart';

class SignIn extends StatefulWidget{
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<Product> items=[];
  
  final DatabaseService _databaseService= DatabaseService();
  @override
  void initState() {
    super.initState();
    
    _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
  }

  Future <void> _loadProductData() async {
    await _databaseService.readProductData(items);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      
      appBar: AppBar(
        backgroundColor:const Color(0xff574E6D),
        foregroundColor: Colors.white,
        
        
      ),
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
        child: SingleChildScrollView(
          child:  Column(
            children: [
        
              const SignInIcon(),
              SignInContent(items: items,),
            ],
          ),
        ),
      ),
    );
  }
}