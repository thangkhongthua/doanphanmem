import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_market/page/home/widgets/register_content.dart';
import 'package:food_market/page/home/widgets/register_icon.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget{
    const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final databaseReference = FirebaseDatabase.instance.ref();
  

  final _formkey = GlobalKey<FormState>();

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
        child: const SingleChildScrollView(
          child: Column(
            children: [
               RegisterIcon(),
                RegisterContent(),
             
             
            ],
          ),
        ),
      ),
    );
  }
}