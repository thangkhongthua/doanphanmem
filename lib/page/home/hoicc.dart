// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class SearchFilterPage extends StatefulWidget {
//   @override
//   _SearchFilterPageState createState() => _SearchFilterPageState();
// }

// class _SearchFilterPageState extends State<SearchFilterPage> {
//   final FirebaseDatabase _database = FirebaseDatabase.instance;
//   final TextEditingController _searchController = TextEditingController();
//   List<dynamic> _data = [];
//   List<dynamic> _filteredData = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   Future<void> _loadData() async {
//     final snapshot = await _database.ref('Product').once();
//     setState(() {
//       _data = snapshot.value ?? [];
//       _filteredData = _data;
//     });
//   }

//   void _filterData(String query) {
//     setState(() {
//       _filteredData = _data.where((item) =>
//           item['name'].toString().toLowerCase().contains(query.toLowerCase())).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search and Filter'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: _filterData,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredData.length,
//               itemBuilder: (context, index) {
//                 final item = _filteredData[index];
//                 return ListTile(
//                   title: Text(item['name']),
//                   subtitle: Text(item['description']),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }