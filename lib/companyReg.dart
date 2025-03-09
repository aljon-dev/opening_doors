import 'package:flutter/material.dart';
import 'package:opening_doors/getStart.dart';
import 'package:opening_doors/login.dart';
import 'package:opening_doors/register.dart';

class companyReg extends StatefulWidget{
    const companyReg ({Key? key});


    @override
    State<companyReg> createState()=> companyRegState();

}


class companyRegState  extends State<companyReg>{
 Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> register()));
                },
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                )
              ),
              Text("Create an account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("Enter your account details below or ", style: TextStyle(fontSize: 16)),
                  TextButton(onPressed: (){}, child:Text("log in", style: TextStyle(fontSize: 16,  decoration: TextDecoration.underline, color:Colors.black)),)
                ],
              ),
              SizedBox(height: 20),
               Text("Company Name"),
              _buildTextField(label: "Company Name"),
          
              Text("Email"),
              _buildTextField(label: "Email"),
             
              Text("Password"),
              _buildTextField(label: "Password", obscureText: true),
              Text("Confirm Password"),
              _buildTextField(label: "Confirm Password", obscureText: true),
            
              SizedBox(height: 20),
              Center(child:  SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                  ),
                onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> getStart()));

                },
                
                child: Text("Sign In",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ),
              ),)
             
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({required String label, bool obscureText = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: obscureText ? Icon(Icons.visibility) : null,
      ),
    ),
  );
}

Widget _buildDropdownField() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Type of Disability",
        border: OutlineInputBorder(),
      ),
      items: ["None", "Visual", "Hearing", "Mobility", "Cognitive"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {},
    ),
  );
}

Widget _buildFileUpload() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: "PWD ID",
              border: OutlineInputBorder(),
              suffixIcon:  ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
            ),
          onPressed: () {},
          child: Text("Choose File"),
        ),
            ),
          ),
        ),
        SizedBox(width: 10),
       
      ],
    ),
  );
}



    


