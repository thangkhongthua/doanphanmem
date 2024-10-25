
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_market/page/home/signIn_page.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';

// ignore: must_be_immutable
class RegisterContent extends StatefulWidget {
   const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
  
}
String email="", password="",name="";

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

class _RegisterContentState extends State<RegisterContent> {
  bool _obscureText = true;
  // ignore: prefer_typing_uninitialized_variables
  final _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  String email="",name="",password="", userId="";

  Future<void> registration(BuildContext context) async {
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
    
    
  );
  final id =DateTime.now().microsecond.toString();
                  databaseReference.child('Account').child(FirebaseAuth.instance.currentUser?.uid ?? '').set({
                    'name': nameController.text.toString(),
                    'email':emailController.text.toString(),
                    'password':passwordController.text.toString(),
                    'id':id,

                  });
  
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('The password provided is too weak.'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              // Xử lý khi người dùng bấm vào nút Đóng
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
        ),)
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:const Text('The account already exists for that email.'),
            duration:const Duration(seconds: 3),
            action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              // Xử lý khi người dùng bấm vào nút Đóng
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
        ),)
          );
        }
        
      } catch (e) {
        print(e);
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignIn()));
        }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Form(
      key: _formkey,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Hãy nhập email';
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Email phải có đuôi "@gmail.com"';
                  }
                  return null;
                },
                controller: emailController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Colors.white, // Thay đổi màu của labelText
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              TextFormField(
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Hãy nhập userName';
                  }final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                  if (specialCharRegex.hasMatch(value)) {
                    return 'UserName không được chứa ký tự đặc biệt';
                  }
                  return null;
                },
                controller: nameController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: 50,
                    ),
                  ),
                  labelText: 'User Name',
                  labelStyle: const TextStyle(
                    color: Colors.white, // Thay đổi màu của labelText
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              TextFormField(
                
                obscureText: _obscureText,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Hãy nhập password';
                  }
                  return null;
                },
                controller: passwordController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: 50,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.white, // Thay đổi màu của labelText
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon:  IconButton(
                   icon: const Icon(Icons.visibility),
                    color: Colors.white,
                    onPressed: (){
                      setState(() {
                        _obscureText=!_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              TextFormField(
                obscureText: _obscureText,
                validator: (value){
                  if(value==null||value!=passwordController.text){
                    return 'Mật khẩu không khớp';
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: 50,
                    ),
                  ),
                  labelText: 'Re-Password',
                  labelStyle: const TextStyle(
                    color: Colors.white, // Thay đổi màu của labelText
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon:  IconButton(
                    icon:const Icon( Icons.visibility),
                    color: Colors.white,
                    onPressed: (){
                      setState(() {
                        _obscureText=!_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 80,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>const SignIn()),
                
                );
                },
                child: const Text(
                  
                  'Bạn đã có tài khoản ?',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              GestureDetector(
                onTap:  () async{
                  if(_formkey.currentState!.validate()){        
                    email=emailController.text;
                    password=passwordController.text;
                    print('thanhcongccne');
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đăng ký thành công ')));
                    // setState(() {
                    //   emailController.text="";
                    //   passwordController.text="";          
                    //   nameController.text="";
                    // });
                  }
                  
                  await registration(context);
                  
                
                },
                child: Container( 
                  alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width / 1,
                  decoration: BoxDecoration(
                    color:  const Color(0xffDDDDDD),
                    borderRadius: BorderRadius.circular(20),
                    
                    // minimumSize: MaterialStatePropertyAll(Size(size.width / 1, size.height / 14)),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Color(0xff574E6D),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}