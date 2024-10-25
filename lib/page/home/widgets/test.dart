// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:food_market/models/database_service.dart';
// import 'package:food_market/models/item.dart';
// import 'package:food_market/models/product.dart';
// import 'package:food_market/page/home/detail_page.dart';
// import 'package:food_market/page/home/widgets/home_card.dart';
// import 'package:food_market/page/home/widgets/real_time_crud.dart';

// // ignore: must_be_immutable
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   final _databaseService = DatabaseService();
//   List<Product> items = []; // Khai báo items là một danh sách rỗng

//   @override
//   void initState() {
//     super.initState();
//     _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
//   }

//   Future <void> _loadProductData() async {
//     await _databaseService.readProductData(items);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Sử dụng items để xây dựng giao diện
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
//       },
//       child: Column(
//         children: [
//           const Text(
//             'cate',
//             style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold
//             ),
//           ),
//           hoSrcoll(),
//         ],
//       ),
//     );
//   }

//   SingleChildScrollView hoSrcoll() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Row(
//         children: items.map((item) => HomeCard(item: item)).toList(),
//       ),
//     );
//   }
// }