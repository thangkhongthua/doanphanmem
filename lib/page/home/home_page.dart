import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/discount.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/cart_page.dart';
import 'package:food_market/page/home/detail_page.dart';



class HomePage extends StatefulWidget {
  String account;
  List<Product> items;
   HomePage({super.key, required this.account, required this.items});
  

  @override
  State<HomePage> createState() => _SearchBarAppState();
  
}

List<Product> cc = [];
List<String> data=[];
List<DiscountABC> diss=[];
String account='';
final databaseReference =FirebaseDatabase.instance.ref('Product');
DatabaseService _databaseService= DatabaseService();
final List<Product> list=[]; 
class _SearchBarAppState extends State<HomePage> {
  bool isDark = false;
  List<Product> pro = [];
  
@override
  void initState() {
    super.initState();
     // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
     for(int i =0; i<widget.items.length;i++){
      data.add(widget.items[i].name);
     }
     cc=widget.items;
     account=widget.account;
     _loadDisData();
  }
  List<String> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  Future <void> _loadDisData() async {
    await _databaseService.readDis(diss);
    setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: Image.asset('asset/images/icons/menu.png'),
        ),
        actions: [
    
    IconButton(
      icon: Image.asset('asset/images/icons/Cart.png'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart(account: widget.account,diss: diss,)));
        // Xử lý sự kiện khi nhấn vào icon
      },
    ),
  ],  
      ),
        body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          GestureDetector(
            onTap: (){
              showSearch(context: context, delegate: CustomSearch());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Màu viền
                  width: 2.0, // Độ rộng viền
                  style: BorderStyle.solid, // Kiểu viền
                ),
                borderRadius: BorderRadius.circular(20.0),
                
              ),
              
              child: Row(
                children:[
                  IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: const Icon(Icons.search),
                
                ),
                const Text('Tìm kiếm')
                ] 
              ),
            ),
          ),
          
        
 
const SizedBox(height: 10,),
          const Row(
             
            children:
            [
              SizedBox(width: 25,) ,
              Text('Cơm' ,style: TextStyle(fontSize: 24, color: Color(0xff574E6D), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
             textAlign: TextAlign.left,),] 
          ),
          hoilamgi('Cơm'),
          const SizedBox(height: 10,),
          const Row(
             
            children:
            [
              SizedBox(width: 25,) ,
              Text('Nước uống' ,style: TextStyle(fontSize: 24, color: Color(0xff574E6D), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
             textAlign: TextAlign.left,),] 
          ),          hoilamgi('Nước Uống'),
          
                  
        ]
        
      ),
      ),
    );
  }
final _scrollController = ScrollController();
  Expanded hoilamgi(String cc) {
    return Expanded(
   // Hiển thị thanh cuộn khi cần
    child: FirebaseAnimatedList(
      query: databaseReference,
      itemBuilder: (context, snapshot, index, animation) {
        String test = "";
        if (animation == 1) {
          test = cc;
        } else {
          test = "";
        }
        if (snapshot.child('category').value.toString() == cc) {
          print(snapshot.child('img'));
          return GestureDetector(
            onTap: () {
              Product pro = Product(
                id: snapshot.child('id').value.toString(),
                name: snapshot.child('name').value.toString(),
                category: snapshot.child('category').value.toString(),
                image: snapshot.child('image').value.toString(),
                price: int.tryParse(snapshot.child('price').value.toString()) ?? 0,
                des: snapshot.child('des').value.toString(),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(product: pro, account: widget.account, diss: diss,),
                ),
              );
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      
                      color: const Color(0xff574E6D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          snapshot.child("name").value.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Giá : ${snapshot.child("price").value}đ',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: Image.network(
                              snapshot.child('image').value.toString(),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    ),
  );

  }

  
}
class CustomSearch extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(onPressed: (){
        query=' ';
      }, icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      close(context, null);
      
    }, icon: const Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
   List<Product> matchQuey =[];
    for(var item in cc){
      if(item.name.toLowerCase().contains(query.toLowerCase())){
        matchQuey.add(item);
      }
    }
    return ListView.builder(itemBuilder: (context, index){
      var result = matchQuey[index].name;
      return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: const Color(0xff574E6D),),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.network(matchQuey[index].image,
              width: 100,
              height: 100,fit: BoxFit.cover,),
            ),
           Expanded(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(result, style: const TextStyle(color: Colors.white, fontSize: 18),),
             Text('Giá : ${matchQuey[index].price}đ', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
             
                
              Text(matchQuey[index].des,
                  maxLines: 2,
                  
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12.0, color: Colors.white, fontStyle: FontStyle.italic ),
                  ),
                
              ],
              
             ),
           ),
          
        ]),
      );
    },
    itemCount: matchQuey.length,);
 
  }

  @override
Widget buildSuggestions(BuildContext context) {
  List<Product> matchedProducts = [];
  for (var item in cc) {
    if (item.name.toLowerCase().contains(query.toLowerCase())) {
      matchedProducts.add(item);
    }
  }

  return ListView.builder(
    itemCount: matchedProducts.length,
    itemBuilder: (context, index) {
      var result = matchedProducts[index].name;
      return GestureDetector(
        onTap: () {
          // Navigate to the detail page when a suggestion is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                product: matchedProducts[index],
                account: account,
              diss: diss,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff574E6D),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.network(
                  matchedProducts[index].image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Giá : ${matchedProducts[index].price}đ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      matchedProducts[index].des,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
