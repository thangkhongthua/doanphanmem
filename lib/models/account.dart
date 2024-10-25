class Account{
  final String id;
  String name;
  String email;
  String password;
  Account({required this.id, required this.name,required this.email,required this.password});
    Map<String,dynamic> toMap()=>{"id":id,"name":name,"email":email,"password":password, };
}