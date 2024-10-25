import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff574E6D),
              Color.fromARGB(255, 23, 20, 32),
            ]
          )
        ),
        
          child: Stack(
            children: [
               Container(
          margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          
          width: double.infinity,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffD1D1D6), 
              width: 2.0, // Đặt độ rộng border là 2 điểm
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 90,),
               const Row(children: [SizedBox(width: 10,),Text('Name',style:TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,), )]),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xffD1D1D6), 
                      width:2.0
                    )
                  ),
                  child:const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Nguyễn Văn Hoàn', style: TextStyle(fontSize: 17,color: Colors.black),)),
                ),
                const Row(children: [SizedBox(width: 10,),Text('Email',style:TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,), )]),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xffD1D1D6), 
                      width:2.0
                    )
                  ),
                  child:const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('NguyenHoan@gmail.com', style: TextStyle(fontSize: 17,color: Colors.black),)),
                ),
                const Row(children: [SizedBox(width: 10,),Text('Date of birth',style:TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,), )]),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xffD1D1D6), 
                      width:2.0
                    )
                  ),
                  child:const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('31/10/2004', style: TextStyle(fontSize: 17,color: Colors.black),)),
                )
              ],
            ),
          ),
               ),
              Positioned(
                right: size.width/3.2,
                top: 15, // Di chuyển hình ảnh lên 20 điểm
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'asset/images/avatar/image.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ]
        ),
      )
      
    );
    
  }
}