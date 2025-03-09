





import 'package:flutter/material.dart';
import 'package:opening_doors/skillSet.dart';

class getStart extends StatelessWidget{
  const getStart ({Key? key});


    @override 

     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Column(
       
         children: [

          Image.asset('assets/img/logo3.png'),
          Text("Hey User Ready to open the Door \n to your next big opportunity?", style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
          const SizedBox(height: 20,),
          Text("Take the first step towards your dream career \n by creating your professional profile. We`re \n here to help you showcase your unique skills \n and connect with inclusive employers",
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),
          textAlign: TextAlign.center,),


          const SizedBox(height: 20,),
          SizedBox(width: 150,child: 
          ElevatedButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> Skillset()));
            

          },style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 230, 121, 13),
                foregroundColor: Colors.black,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
          ),
          child:Text("Get Started"))


,)


        ],
      )
    );
  }
}




