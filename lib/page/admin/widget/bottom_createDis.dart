import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';


class BottomCreateDis extends StatefulWidget {
     const BottomCreateDis({super.key});
     
  @override
  State<BottomCreateDis> createState() => _StateCreateDis();
}
final DatabaseService _databaseService= DatabaseService();
List<Category> items = []; 
 List<String> list=[];
TextEditingController nameController= TextEditingController();
TextEditingController percent= TextEditingController();
final databaseReference = FirebaseDatabase.instance.ref('Discount');



 

class _StateCreateDis extends State<BottomCreateDis> {
 
 
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
              TextField(
                controller: nameController,             
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Nhập nội dung chương trình :'
              ),
              
            ),
            
            
            const SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.number,
                controller: percent,             
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Nhập phần trăm giảm giá :',
                

              ),
              
            ),
            
            
            const SizedBox(height: 10,),
            const SizedBox(height: 20,),
           
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:() {
                  
                  final id =DateTime.now().microsecond.toString();
                  final date =DateTime.now().toString();
                  Random random = Random();
                  int randomNumber=0;
                    for (int i = 0; i < 5; i++) {
                       randomNumber= random.nextInt(100000);
                      
                    }
                  // final cmt = CommentABC(id: id, comment: nameController.text, acc: accc);
                  // _databaseService.createComment(cmt);
                  databaseReference.child(id).set({
                    'id':id,
                    'name':nameController.text,
                    'per':percent.text,
                    'date':date,
                    'ma':randomNumber,
                    

                  });
                  nameController.clear();
                    Navigator.pop(context);
                },
              child:const Text('Submit')),
            ),
          ],
        ),
      ),
    );
  }
}
List<int> generateRandomNumbers() {
  Random random = Random();
  List<int> randomNumbers = [];

  for (int i = 0; i < 5; i++) {
    randomNumbers.add(random.nextInt(100)); // Tạo số ngẫu nhiên từ 0 đến 99
  }

  return randomNumbers;
}