
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages


class CardBody extends StatelessWidget {  
    CardBody({super.key, required items});
 
  var items;
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),  
        // color:(index%2==0)?Colors.red:Colors.green,
      ),
      child:  Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [        
          Text(
              items.name,
                 
          ),
          InkWell(
            onTap: () async{  
              // if(await confirm(context)){
              //   handleDelete(items.id);
              // }
              // else return;
            },
            child: const Icon(
              
              Icons.delete,
            
            ),
          )
        ],
      )
      ),
    );
  }
}
