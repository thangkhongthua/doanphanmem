// import 'package:flutter/material.dart';
// import 'package:food_market/models/item.dart';
// import 'package:food_market/page/home/widgets/bottom_card.dart';
// import 'package:food_market/page/home/widgets/card_body_widget.dart';
// import 'package:food_market/page/home/widgets/home_content.dart';

// class AddItem extends StatefulWidget{
//   const AddItem({super.key});

//   @override
//   State<AddItem> createState() => _AddItemState();
// }

// class _AddItemState extends State<AddItem> {





//   final List<DataItem> items =[   
//   ];
//   void handleAddTask(String name,int price, String img, String category){
//     final newDate = DataItem(id: DateTime.now().toString(), name: name,price:price,img:img,category:category);
//     setState(() {
//       items.add(newDate);
//     });
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     // TODO: implement build
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(  
//           children: items.map((item) => CardBody(items:item,
//           )).toList(),
//         ),
//       ),floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           showModalBottomSheet(context: context, builder: (BuildContext content  ){
//               return BottomCard(addTask: handleAddTask);
//           });
//         },
        
//       ),
//     );   
//   }
// }