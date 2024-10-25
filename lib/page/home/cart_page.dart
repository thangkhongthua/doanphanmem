import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:food_market/models/discount.dart';
import 'package:food_market/page/home/confirm_page.dart';
import 'package:food_market/page/home/home_page.dart';


class Cart extends StatefulWidget {
  var  account;
  List<DiscountABC> diss;
   Cart({super.key, required this.account, required this.diss});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int total=0;
    final databaseReference = FirebaseDatabase.instance.ref('Account').child(widget.account).child('Cart');
  Size size = MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xff574E6D),
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('asset/images/icons/like.png'),
        )
      ],
    ),
    body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    int ja=0;
                    total+=int.tryParse(snapshot.child('pricetotal').value.toString()) ?? 0;
                    print('ccccc $total');
                    // if(animation % 2==0){
                    //     color=0xffFFF; 
                    // }
                    // else {
                    //   color=0xffEEEEEE;
                    // }
                    return GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateCauthu(id: snapshot.child('nameCLB').value.toString())));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        // color: Color(color),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            snapshot.child("name").value.toString(),
                            
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giá : ${snapshot.child("price").value}đ'),
                              
                              // Text('Số lượng cầu thủ : ${snapshot.child('soLuong').value.toString()}'),
                              Container(
                                child: Column(
                                  children: [Row(
                                   children: [
                                     ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          if((int.tryParse(snapshot.child('quant').value.toString()) ?? 0)<2){
                                            databaseReference.child(snapshot.child('name').value.toString()) .update({
                                            'quant':1,
                                            'pricetotal':snapshot.child('price').value.toString(),
                                            // 'pricetotal':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0)*(int.tryParse(snapshot.child('price').value.toString()) ?? 0)
                                      });   
                                        }
                                        else {
                                          databaseReference.child(snapshot.child('name').value.toString()) .update({
                                            'quant':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0)-1,
                                            // 'pricetotal':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0)*(int.tryParse(snapshot.child('price').value.toString()) ?? 0)
                                      });
                                      databaseReference.child(snapshot.child('name').value.toString()) .update({
                                            // 'quant':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0)-1,
                                            'pricetotal':((int.tryParse(snapshot.child('quant').value.toString()) ?? 0)-1)*(int.tryParse(snapshot.child('price').value.toString()) ?? 0)
                                      });
                                        }                             
                                        });
                                      },
                                      child: const Text('-'),
                                    ),
                                    Text(snapshot.child('quant').value.toString()),
                                    ElevatedButton(
                                      onPressed: (){
                                        
                                    setState(() {
                                  
                                        databaseReference.child(snapshot.child('name').value.toString()) .update({
                                            'quant':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0) + 1,
                                            // 'pricetotal':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0)*(int.tryParse(snapshot.child('price').value.toString()) ?? 0),
                                      });
                                      databaseReference.child(snapshot.child('name').value.toString()) .update({
                                            // 'quant':(int.tryParse(snapshot.child('quant').value.toString()) ?? 0) + 1,
                                            'pricetotal':((int.tryParse(snapshot.child('quant').value.toString()) ?? 0)+1)*(int.tryParse(snapshot.child('price').value.toString()) ?? 0)
                                      });
                                      
                                    });
                                       
                                      },
                                      child:const Text('+'),
                                    ),
                                    
                                   ],
                                  ),
                                  Text('Tổng giá tiền ${snapshot.child('quant').value.toString()} món : '+snapshot.child('pricetotal').value.toString()+ "đ"),
                                  ]
                                ),
                              ),
                            ],
                          ),
                              
                          leading: CircleAvatar(
                            radius: 50,
                              child: ClipOval(
                                child: Image.network(snapshot.child('image').value.toString()),
                              ),
                            
                          ),
                          
                          trailing: PopupMenuButton(
                            offset: const Offset(0, 50),
                            color: const Color(0xff574E6D),
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              // For Update Operation
                              
                              // For Delete Operation
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    databaseReference.child(snapshot.child('name').value.toString())
                                        .remove();
                                  },
                                  leading: const Icon(Icons.delete, color: Colors.white,),
                                  title: const Text("Xóa món", style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    );
      
                  })),
                  ElevatedButton(onPressed: (
                  ){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPage(account: widget.account,diss: diss,)));
                  }, child: const Text('Xác nhận mua', style: TextStyle(color: Colors.black),))
        ]
      ),
  );
}
}
class Card_Item_Cart extends StatelessWidget {
  const Card_Item_Cart({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: size.width/1.2,
      height: size.height/6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffDDDDDD),
      ),
      child: Row(
      
        children: [
            Image.asset('asset/images/avatar/dualeo.png'),
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
           const Text('Dưa leo', style: TextStyle(fontSize: 17,color: Color(0xff43405D)),textAlign: TextAlign.left,),
          
            const SizedBox(height: 60,),
           Row(
             children:[ const 
             Column(
              children: [
                Row(
                  children: [
                    
                    Text('Price : ', style: TextStyle(color: Color(0xff43405D), fontSize: 12),),
                    Text('30.000đ',style: TextStyle(color: Color(0xff43405D),fontSize: 12)),
                  ],
                ),
                Text('27.000đ', style: TextStyle(color: Color(0xff43405D),fontSize: 12, fontWeight: FontWeight.bold),)
              ],
    
                           ),
                           const SizedBox(width: 10,),
                           Container(
                                height: 20,width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20) ,
                                  color: const Color(0xff574E6D),
                                ),
                                child: Image.asset('asset/images/icons/kkk.png'
                                ),
                           )
                           ]
           ),
        ] ),
             
            
        ],
      ),
    );
  }
}