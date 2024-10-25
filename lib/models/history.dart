import 'package:food_market/models/cart.dart';

class History{
  final String id;
  List<CartABC> name;
  int totalprice;
  
  
  History({required this.id, required this.name, required this.totalprice, });
  
 
  Map<String,dynamic> toMap()=>{"id":id,"name":name,"totalprice":totalprice,};
}