import 'package:flutter/material.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/cart_page.dart';
import 'package:food_market/page/home/favourite.dart';
import 'package:food_market/page/home/home_page.dart';
import 'package:food_market/page/home/profile_page.dart';



class NavigationMenu extends StatefulWidget {
  var account;
  List<Product> items;
  
   NavigationMenu({super.key, required this.account, required this.items});
   

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
   late var account;
   
  int myCurrentindex=0;
  List<Widget> get page => [
    HomePage(account: account, items: widget.items,),
    Favourite(account: account),
    Cart(account: account,diss: diss,),
    ProfilePage(acc: account,),
  ] ;
  
@override
  void initState() {
    super.initState();
    account = widget.account;
    print(account);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 23, 20, 32),
      bottomNavigationBar: Container(
  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
  decoration: BoxDecoration(
    color: Colors.transparent,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        offset: const Offset(8, 20),
        blurRadius: 25,
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(30),
    
    child: BottomNavigationBar(
      currentIndex: myCurrentindex,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      onTap: (index) {
        setState(() {
          myCurrentindex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    ),
  ),
),
      body: page[myCurrentindex],
    );
  }
}