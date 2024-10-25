import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';


class BottomCard extends StatefulWidget {
  
   const BottomCard({
    super.key,
    
    
  }); 

  @override
  State<BottomCard> createState() => _BottomCardState();
}
List<Category> items = []; 
 List<String> list=["1","2","3","4","5"];


TextEditingController nameController= TextEditingController();

TextEditingController priceController= TextEditingController();

TextEditingController imageController= TextEditingController();

TextEditingController categoryController= TextEditingController();
TextEditingController desController= TextEditingController();

class _BottomCardState extends State<BottomCard> {
 
  // Khai báo items là một danh sách rỗng

  

// String title='';
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
              TextField(
                controller: nameController,             
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Name'

              ),
            ),
            const SizedBox(height: 20,),
            TextField(
                controller: priceController,
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Price'
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
                controller: imageController ,
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) , 
                ),
                labelText: 'Image'  
              ),
            ),
            const SizedBox(height: 20,),
            const DropdownMenuExample(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:() {
                  final id =DateTime.now().microsecond.toString();
                  final product = Product(id: id, name: nameController.text, category: categoryController.text, image: imageController.text, price: int.tryParse(priceController.text) ?? 0,des:  desController.text);
                  // _databaseService.create(product);
                  // List<Product> pro= [];
                  // _databaseService.readProductData(pro);
                  nameController.clear();
                  categoryController.clear();
                  imageController.clear();
                    //For Dismiss the keyboard afte adding items
                    Navigator.pop(context);
                },
              child:const Text('Submit')),
            ),
          ],
        ),
      ),
    );
  }
  
}
class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final _databaseService = DatabaseService();
  // Khai báo items là một danh sách rỗng
  
  @override
  void initState() {
    super.initState();
    _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
    for(int i =0; i<items.length;i++){
      list.add(items[i].nameCate);
    }
  }

  Future <void> _loadProductData() async {
    await _databaseService.readCateData(items);
    setState(() {
      
    });
  }
  
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}




