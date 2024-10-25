import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';


class BottomCreateComment extends StatefulWidget {
     BottomCreateComment({super.key,required this.acc, required this.pro});
     String acc;
     Product pro;

  @override
  State<BottomCreateComment> createState() => _StateBottomComment();
}
final DatabaseService _databaseService= DatabaseService();
List<Category> items = []; 
 List<String> list=[];
TextEditingController nameController= TextEditingController();
final databaseReference = FirebaseDatabase.instance.ref('Comment');



 

class _StateBottomComment extends State<BottomCreateComment> {
 
 
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
                labelText: 'Hãy nêu cảm nghĩ về sản phẩm :'
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
                  // final cmt = CommentABC(id: id, comment: nameController.text, acc: accc);
                  // _databaseService.createComment(cmt);
                  databaseReference.child(widget.pro.name + id).set({
                    'id':id,
                    'detail':nameController.text,
                    'acc':widget.acc,
                    'date':date,
                    'name':widget.pro.name,
                    'img':widget.pro.image

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