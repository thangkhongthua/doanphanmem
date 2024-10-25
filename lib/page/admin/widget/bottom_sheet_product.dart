import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';

class BottomSheetProduct extends StatefulWidget {
  final List<Category> list;

  const BottomSheetProduct({super.key, required this.list});

  @override
  _BottomSheetProductState createState() => _BottomSheetProductState();
}
 String? select;
class _BottomSheetProductState extends State<BottomSheetProduct> {
  List<String> items = [];
 

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final DatabaseService _databaseService=DatabaseService();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.list.length; i++) {
      items.add(widget.list[i].nameCate);
    }
    select = items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Tên sản phẩm',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: desController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Mô tả sản phẩm',
              ),
            ),
            const SizedBox(height: 20),
            
            TextField(
              keyboardType: TextInputType.number,
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Giá',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Hình ảnh',
              ),
            ),
            const SizedBox(height: 20),
            DropdownMenuApp(list: items, selectedValue: select),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print(select.toString());
                  final id = DateTime.now().microsecond.toString();
                  final product = Product(
                    id: id,
                    name: nameController.text,
                    category: select.toString(),
                    image: imageController.text,
                    price: int.tryParse(priceController.text) ?? 0,
                    des: desController.text,
                  );
                  _databaseService.create(product);
                  // List<Product> pro = [];
                  // _databaseService.readProductData(pro);
                  nameController.clear();
                  priceController.clear();
                  imageController.clear();
                  // For Dismiss the keyboard after adding items
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final databaseReference = FirebaseDatabase.instance.ref("Category");
List<Category> items = [];

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key, required this.list, required this.selectedValue});
  final List<String> list;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: selectedValue,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        if (value != null) {
          select = value;
        }
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}