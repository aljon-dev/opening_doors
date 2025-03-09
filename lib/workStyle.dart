



import 'package:flutter/material.dart';
import 'package:opening_doors/workStyle2.dart';

class workStyle extends StatefulWidget {
  @override
  State<workStyle> createState() => _WorkStyleScreenState();
}

class _WorkStyleScreenState extends State<workStyle> {
  String? selectedOption;

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  Widget buildOptionCard(String title, String description) {
    bool isSelected = selectedOption == title;
    return GestureDetector(
      onTap: () => selectOption(title),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),// Adjust for top spacing
            Text(
              "Select Your Preferred Work Style",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Choose the work arrangement that best suits your needs.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 24),

          // Work Style Options
            buildOptionCard("Remote", "Work from anywhere with flexible scheduling"),
            buildOptionCard("Hybrid", "Mix of remote and office work for the best of both worlds"),
            buildOptionCard("Onsite", "Traditional office environment with in-person collaboration"),

            Spacer(),

      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.orange),
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(),
                ),

         
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> workStyle2()));
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.orange,
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