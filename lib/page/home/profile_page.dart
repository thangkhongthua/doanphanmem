import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key, required this.acc});
String acc;


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
 String name = '';
 late String avt;
class _ProfilePageState extends State<ProfilePage> {
  final databaseReference = FirebaseDatabase.instance.ref("Account");
   @override
  void initState() {
    super.initState();
   
    loadAccountData();
  }

  void loadAccountData() {
    databaseReference.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        setState(() {
          name = event.snapshot.child(widget.acc).child('name').value.toString();
          avt = event.snapshot.child(widget.acc).child('avatar').value.toString();
        });
      } else {
        print('No data available.');
      }
    }, onError: (error) {
      print('Error: $error');
    });
  }
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
          child: Column(
            children:[
              const SizedBox(height: 80,), 
              Container(
                height: 80,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0
                  )
                ),
              child: Text(name, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 5,), 
              Container(
                
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        const SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_setting.png'),
                      const Text('Setting', style: TextStyle(fontSize: 20),)
                    ] ),

                    const SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        const SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_like.png'),
                      const Text('Rate our app', style: TextStyle(fontSize: 20),)

                      
                    ] ),
                    
                    const SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        const SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_term.png'),
                      const Text('Terms & Conditions', style: TextStyle(fontSize: 20),)

                      
                    ] ),
                    const SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        const SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_help.png'),
                      const Text('Help', style: TextStyle(fontSize: 20),)

                      
                    ] ),
                    const SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        const SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_logout.png'),
                      const Text('Log-Out', style: TextStyle(fontSize: 20),)

                      
                    ] ),const SizedBox(height: 30,)
                  ],
                ),
            ),
            
              
            ]
          ),

               ),
              Positioned(
                right: size.width/3.2,
                top: 15, // Di chuyển hình ảnh lên 20 điểm
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    avt,
                    height: 150,
                    width: 150,
                      fit: BoxFit.cover,
                  ),
                ),
              ),
            ]
        ),
      )
      
    );
    
  }

  }
  