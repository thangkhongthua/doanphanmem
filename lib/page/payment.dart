import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_market/page/home/tp_page.dart';

class Payment extends StatefulWidget {
   Payment({super.key, required this.account});
  String account;
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int type =1;
  void handleRadio(Object? e)=>setState(() {
    type= e as int;
  });
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
                        // FirebaseDatabase.instance.ref('Account').child(widget.account).child('Cart').remove();

    final databaseReference = FirebaseDatabase.instance.ref('Account').child(widget.account);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Hình thức thanh toán'),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:Column(
            
            children: [
              const SizedBox(height: 40,),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type==1
                  ?Border.all(width: 1, color: Colors.black)
                  :Border.all(width: 0.3, color:Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                             groupValue: type,
                             onChanged: handleRadio,
                             activeColor: const Color(0xffDB3022),
                             ),
                             Text("Thanh toán khi nhận hàng",
                             style: type==1
                             ?const TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                              :const TextStyle(fontSize: 15, fontWeight:FontWeight.w500,
                              color:Colors.grey)
                              ),
                              Image.asset('asset/images/avatar/dualeo.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type==2
                  ?Border.all(width: 1, color: Colors.black)
                  :Border.all(width: 0.3, color:Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 2,
                             groupValue: type,
                             onChanged: handleRadio,
                             activeColor: const Color(0xffDB3022),
                             ),
                             Text("Thanh toán qua momo",
                             style: type==2
                             ?const TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                              :const TextStyle(fontSize: 15, fontWeight:FontWeight.w500,
                              color:Colors.grey)
                              ),
                              Image.asset('asset/images/avatar/dualeo.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type==3
                  ?Border.all(width: 1, color: Colors.black)
                  :Border.all(width: 0.3, color:Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 3,
                             groupValue: type,
                             onChanged: handleRadio,
                             activeColor: const Color(0xffDB3022),
                             ),
                             Text("Thanh toán qua bank",
                             style: type==3
                             ?const TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                              :const TextStyle(fontSize: 15, fontWeight:FontWeight.w500,
                              color:Colors.grey)
                              ),
                              Image.asset('asset/images/avatar/dualeo.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                
              ),
              const SizedBox(height: 300,
              
              ),
              ElevatedButton(
            onPressed:() {
              print('thanhcong');
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>  TPPage(account: widget.account,)),
              );
            },
            style:  ButtonStyle(
                backgroundColor:const WidgetStatePropertyAll(Color(0xffDDDDDD)),
                minimumSize: WidgetStatePropertyAll(Size(size.width/2, size.height/14)),
            ),
           child: const Text(
              'Xác nhận ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                ,fontSize: 20
              ),
           )
           )
            ],
          )
          ),
      ),
    );
    
    
  }
}