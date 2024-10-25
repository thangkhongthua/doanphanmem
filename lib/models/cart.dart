
class CartABC{
  final String id;
  String name;
  int price;
  int quantity;
  int pricetotal; 
  String image;
  CartABC({required this.id, required this.name, required this.price, required this.quantity, required this.pricetotal,required this.image});
  
 
  Map<String,dynamic> toMap()=>{"id":id,"name":name,"price":price,"quant":quantity,'pricetotal':pricetotal,'image':image };
}