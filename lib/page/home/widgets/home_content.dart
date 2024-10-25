// import 'package:flutter/material.dart';
// import 'package:food_market/models/item.dart';
// import 'package:food_market/models/product.dart';
// import 'package:food_market/page/home/detail_page.dart';
// import 'package:food_market/page/home/widgets/home_card.dart';

// // ignore: must_be_immutable

// class HomeContent extends StatelessWidget{
//   var list;
//    HomeContent({super.key,required this.list});
  
//  final List<Product> items =[];
    
  
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailPage()));
//       },
//       child: Column(
//               children:[ const Text(
//                 'cate',
//                 style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold
//                 ),
//               ),
//               hoSrcoll(),
//               ]
//             ),
//     );
//   }
//   SingleChildScrollView hoSrcoll() {
    
//     return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Row( 
//         children: items.map((item) => HomeCard(item: item)).toList(),
//         // .where((item) => item.category == cate)
//           )
          
//          );
//   }
  
// }