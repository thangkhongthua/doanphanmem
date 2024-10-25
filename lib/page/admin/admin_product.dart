import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/admin/widget/bottom_sheet_product.dart';
import 'package:food_market/page/admin/widget/card_product.dart';


// ignore: must_be_immutable
class AdminProduct extends StatefulWidget {
  const AdminProduct({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<AdminProduct> {
    var color=0xffDDDDDD;

  final _databaseService = DatabaseService();
  List<Category> list=[];
  
  
  final databaseReference = FirebaseDatabase.instance.ref("Product");
  
  List<Product> items = []; // Khai báo items là một danh sách rỗng

  

  @override
  Widget build(BuildContext context) {
    setState(() {
      _databaseService.readCateData(list);
    print(list);
    });
    // Sử dụng items để xây dựng giao diện
      return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color(0xff574E6D),
        centerTitle: true,
        title:const Text('Những loại món ăn', style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold,
          color: Colors.white
          
        ),),
      ),
      body:Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    
                    if(animation % 2==0){
                        color=0xffFFF; 
                    }
                    else {
                      color=0xffEEEEEE;
                    }
                    return GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateCauthu(id: snapshot.child('nameCLB').value.toString())));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        color: Color(color),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            snapshot.child("name").value.toString(),
                            
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giá : ${snapshot.child("price").value}đ'),
                              // Text('Số lượng cầu thủ : ${snapshot.child('soLuong').value.toString()}'),
                      
                            ],
                          ),
                              
                          leading: CircleAvatar(
                            radius: 50,
                              child: ClipOval(
                                child: Image.network(snapshot.child('image').value.toString(),
                                                            ),
                              ),
                            
                          ),
                          
                          trailing: PopupMenuButton(
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              // For Update Operation
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    // Navigator.pop(context);
                                    // showModalBottomSheet(context: context, builder: (BuildContext context){
                                    //     // return UpdateBottom(
                                    //     // name: snapshot.child('nameCate').value.toString(),
                                    //     // des: snapshot.child('des').value.toString(),
                                    //     // img: snapshot.child('img').value.toString(), 
                                    //     // id: snapshot.child('idCate').value.toString(),
                                    //     // );
                                    // });
                                  },
                                  leading: const Icon(Icons.edit),
                                  title: const Text("Edit"),
                                ),
                              ),
                              // For Delete Operation
                              PopupMenuItem(
                                value: 2,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    databaseReference.child('name ${snapshot.child('nameCLB').value.toString()}')
                                        .remove();
                                  },
                                  leading: const Icon(Icons.delete),
                                  title: const Text("Delete"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
      
                  })),
                  ElevatedButton(onPressed: (){ 
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateBattle()));
                  }, child: const Text('Xếp bảng đấu', style: TextStyle(color: Colors.black),))
        ]
      ),

      floatingActionButton: FloatingActionButton(
  child: const Icon(Icons.add),
  onPressed: (){

    showModalBottomSheet(context: context, builder: (BuildContext content){
      return BottomSheetProduct(list: list,);
    });
  }
),
    );
  }

  SingleChildScrollView hoSrcoll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: items.map((item) => CardProduct(item: item)).toList(),
      ),
    );
  }
}