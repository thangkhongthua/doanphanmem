import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';


class UpdateBottom extends StatelessWidget {
     UpdateBottom({super.key, required this.name,required this.des,required this.img, required this.id});
  
var name,des,img,id;
final DatabaseService _databaseService= DatabaseService();
List<Category> items = []; 
 List<String> list=[];
TextEditingController nameController= TextEditingController();
TextEditingController desController=TextEditingController();
TextEditingController imgController=TextEditingController();

   @override
  Widget build(BuildContext context) {
    
     nameController.text=name;
     desController.text=des;
     imgController.text=img;
    
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
                  databaseReference.child('Category').child('name $name').update({
                    'nameCate':nameController.text,
                    'img':imgController.text,
                    'des':desController.text,
                  }
                  
                  );
                  print(name);
                },
              child:const Text('Update')),
            ),
          ],
        ),
      ),
    );
  }

}
