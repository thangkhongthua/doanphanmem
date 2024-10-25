class DiscountABC{
  final String id;
  int per;
  String ma;
  String name;
  DiscountABC({required this.id, required this.per, required this.ma, required this.name});
  Map<String,dynamic> toMap()=>{"id":id,"per":per, 'ma': ma,'name':name};
}