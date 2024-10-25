import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';


class BottomOption extends StatefulWidget {
  const   BottomOption({super.key});

  @override
  State<BottomOption> createState() => _BottomOptionState();
}
final DatabaseService _databaseService= DatabaseService();
List<Category> items = []; 
 List<String> list=[];
TextEditingController nameController= TextEditingController();
TextEditingController desController=TextEditingController();
TextEditingController imgController=TextEditingController();





class _BottomOptionState extends State<BottomOption> {
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
                labelText: 'Tên loại :'
              ),
              
            ),
            const SizedBox(height: 5,),
            TextField(
                controller: desController,             
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Giới thiệu về loại :'
              ),
              
            ),
            const SizedBox(height: 5,),
            TextField(
                controller: imgController,             
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Hình ảnh minh họa :'
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
                  final clb = Category(idCate: id, nameCate: nameController.text,descript: desController.text,img: imgController.text);
                  _databaseService.createCate(clb);
                  nameController.clear();
                  desController.clear();
                  imgController.clear();
                 
                    
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