

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/page/admin/widget/bottom_createDis.dart';
import 'package:food_market/page/admin/widget/update_bottom_sheet.dart';



class AdminDis extends StatefulWidget {
   const AdminDis({super.key});

  @override
  State<AdminDis> createState() => _AdminDisState();
}

class _AdminDisState extends State<AdminDis> {
  var color=0xffDDDDDD;
  final _databaseService = DatabaseService();
  final databaseReference = FirebaseDatabase.instance.ref("Discount");
  List<Category> items = []; // Khai báo items là một danh sách rỗng

  @override
  void initState() {
    super.initState();
    // _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
  }

  // Future <void> _loadProductData() async {
  //   await _databaseService.readCLBData(items);
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
    // Sử dụng items để xây dựng giao diện
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color(0xff574E6D),
        centerTitle: true,
        title:const Text('Danh sách mã giảm giá', style: TextStyle(
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
                    print(snapshot.child('img').value.toString());
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
                            'Nội dung: ${snapshot.child("name").value}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phần trăm giảm giá: ${snapshot.child("per").value}%'),
                              Text('Mã giảm giá: ${snapshot.child("ma").value}'),
                              // Text('Số lượng cầu thủ : ${snapshot.child('soLuong').value.toString()}'),
                      
                            ],
                          ),
                              
                          // leading: CircleAvatar(
                          //   radius: 50,
                          //     child: ClipOval(
                          //       child: Image.network(snapshot.child('img').value.toString(),
                          //                                   ),
                          //     ),
                            
                          // ),
                          
                          trailing: PopupMenuButton(
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              // For Update Operation
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    // Navigator.pop(context);
                                    showModalBottomSheet(context: context, builder: (BuildContext context){
                                        return UpdateBottom(
                                        name: snapshot.child('nameCate').value.toString(),
                                        des: snapshot.child('des').value.toString(),
                                        img: snapshot.child('img').value.toString(), 
                                        id: snapshot.child('idCate').value.toString(),
                                        );
                                    });
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
      return const BottomCreateDis();
    });
  }
),
    );
  }

}
