class Product{
  final String id;
   String name;
   String category;
   String image;
   int price;
   String des;
   Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.des,
   });
    

   
   String getID()=>id;
   String getName()=>name;
   void setName(String name){this.name=name;}
   String getCategory()=>category;
   void setCategory(String category){this.category=category;}
   String getImage()=>image;
   void setImage(String image){this.image=image;}
   int getPrice()=>price;
   void setPrice(int price){this.price=price;}
   
  Map<String, dynamic> toMap()=>{"id":id, "name":name,"category":category,"image":image, "price":price, "des":des};
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      category: map['category'],
      image: map['image'],
      des: map['des'],
    );
  }
}