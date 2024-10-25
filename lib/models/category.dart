class Category{
  final String idCate;
  String nameCate;
  String descript;
  String img;
  Category({required this.idCate,required this.nameCate, required this.descript, required this.img});
  
  getIDCate()=>idCate;
  getName()=>nameCate;
  setName(String name){nameCate=name;}
  Map<String,dynamic> toMap()=>{"idCate":idCate,"nameCate":nameCate ,"des":descript,"img":img};
}