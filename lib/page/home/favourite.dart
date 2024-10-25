import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';

class Favourite extends StatefulWidget {
  var account;
   Favourite({super.key,required this.account});
   

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final _databaseService = DatabaseService();

  List<Category> list=[];

  

  List<Product> items = []; 

  @override
  Widget build(BuildContext context) {
    final databaseReference = FirebaseDatabase.instance.ref("Account").child(widget.account).child('Like');
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color(0xff574E6D),
        centerTitle: true,
        title:const Text('Món ăn yêu thích', style: TextStyle(
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
                    
                   
                    return GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateCauthu(id: snapshot.child('nameCLB').value.toString())));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        
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

    );
  }
}