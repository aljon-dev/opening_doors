import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:opening_doors/mainpage.dart';
import 'package:opening_doors/workplace.dart';


class resume extends StatefulWidget {
  @override
   State<resume> createState() => _ResumeUploadScreenState();
}

class _ResumeUploadScreenState extends State<resume> {
  String? selectedFileName;

  Future<void> pickResumeFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Resume",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

          
            GestureDetector(
              onTap: pickResumeFile,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, size: 40, color: Colors.black54),
                    SizedBox(height: 10),
                    Text(
                      selectedFileName ?? "Upload your resume",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
                IconButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> workplace()));
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.orange),
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(),
                ),

                ElevatedButton(
                  onPressed:  () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> mainpage()));
                  } ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Continue"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
