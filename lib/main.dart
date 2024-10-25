
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_market/app/my_app.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
    apiKey: "AIzaSyDgVwJEDnaI5DX-LDr7ni0udGGQmTaJbfk",
    appId: "1:1078077982708:android:5fb600e6626753234ddba1",
    messagingSenderId: "1078077982708",
    projectId: "market-food-1e947"
       )
  );
  runApp(const MyApp());
}