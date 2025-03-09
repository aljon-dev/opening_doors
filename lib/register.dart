



import 'package:flutter/material.dart';
import 'package:opening_doors/companyReg.dart';

class register extends StatefulWidget{
    const register ({Key? key});


    @override
    State<register> createState()=> registerState();

}

class registerState extends State<register>{
 Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
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
               Text("First Name"),
              _buildTextField(label: "First Name"),
               Text("Last Name"),
              _buildTextField(label: "Last Name"),
               Text("Type of Disability"),
              _buildDropdownField(),
              Text("Email"),
              _buildTextField(label: "Email"),
              Text("Phone Number"),
              _buildTextField(label: "Phone Number"),
              Text("Password"),
              _buildTextField(label: "Password", obscureText: true),
              Text("Confirm Password"),
              _buildTextField(label: "Confirm Password", obscureText: true),
               Text("PWD ID"),
              _buildFileUpload(),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> companyReg()));
                },
                
                child: Text("Sign Up",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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



