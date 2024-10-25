import 'package:food_market/models/account.dart';

class CommentABC{
  final String id;
  String comment;
  Account acc;
  CommentABC({required this.id, required this.comment, required this.acc});
  Map<String,dynamic> toMap()=>{"id":id,"comment":comment, 'acc': acc};
}