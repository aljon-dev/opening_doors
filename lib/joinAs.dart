




import 'package:flutter/material.dart';
import 'package:opening_doors/companyReg.dart';
import 'package:opening_doors/register.dart';

class joinAs extends StatefulWidget {
    const  joinAs ({Key? key});


  @override   
  State<joinAs> createState ()=> joinAsState();

}


class joinAsState extends State<joinAs>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image.asset('assets/img/logo2.png'),

            Text("JOIN AS ", style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
             
             SizedBox(height: 20,),

            SizedBox(width: 150,height: 60,
            child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: ( context )=> register()));
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
             child: Text('Candidate',style:TextStyle(
              fontSize: 20,
             ))),),

             const SizedBox(height: 20,),


            SizedBox(width: 150,height: 60,
            child: ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: ( context )=> companyReg()));

            },
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
             child: Text('Company',style:TextStyle(
              fontSize: 20,
             ))),)






        ],
        
      )

   );
  }


    




}