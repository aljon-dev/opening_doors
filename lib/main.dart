import 'package:flutter/material.dart';
import 'package:opening_doors/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opening Doors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OpeningDoors(),
    );
  }
}

class OpeningDoors extends StatefulWidget {
  const OpeningDoors ({super.key,});




  @override
  State<OpeningDoors> createState() => OpeningDoorsState();
}

class OpeningDoorsState  extends State<OpeningDoors> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [

          Image.asset('assets/img/logo1.png'),
          Text("Opening Doors", style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          const SizedBox(height: 20,),
          Text("Conenct with Inclusive empployers\nfind opporturnities that celebrate your \nunique abilities",
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),
          textAlign: TextAlign.center,),


          const SizedBox(height: 20,),
          SizedBox(width: 150,child: 
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));

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
