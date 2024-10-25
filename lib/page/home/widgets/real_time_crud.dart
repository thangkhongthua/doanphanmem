

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/widgets/bottom_card.dart';


class RealTimeCrud extends StatefulWidget{
  const RealTimeCrud({super.key});
  
  @override
  State<RealTimeCrud> createState() => _RealTimeCrud();
  
}final databaseReference = FirebaseDatabase.instance.ref();
final _databaseService = DatabaseService();
final List<Product> lstProduct=[]; 

class _RealTimeCrud extends State<RealTimeCrud>{
  @override
  Widget build(BuildContext context) {
    setState(() {
      _databaseService.readProductData(lstProduct);
    });
    // TODO: implement build
    return Scaffold(
      
backgroundColor: Colors.amber,
appBar: AppBar(
  backgroundColor: Colors.blue,
  centerTitle: true,
  title: const Text('CRUD'),
  
),
body: Column(
  children: [
    Expanded(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    return Card(
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
                        subtitle:
                            Text(snapshot.child("address").value.toString()),
                        leading: CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Text(snapshot.child("sn").value.toString())),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            // For Update Operation
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  // updateBottomSheet(
                                  //   context,
                                  //   snapshot.child("name").value.toString(),
                                  //   snapshot.child("id").value.toString(),
                                  //   snapshot.child("sn").value.toString(),
                                  //   snapshot.child("address").value.toString(),
                                  // );
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
                                  databaseReference
                                      .child(
                                          snapshot.child('id').value.toString())
                                      .remove();
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Delete"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))

  ],
),
floatingActionButton: FloatingActionButton(
  onPressed: (){
    showModalBottomSheet(context: context, builder: (BuildContext content){
      return const BottomCard();
    });
  }
),
    );
  }

}