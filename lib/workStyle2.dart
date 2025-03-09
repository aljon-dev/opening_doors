



import 'package:flutter/material.dart';
import 'package:opening_doors/workStyle.dart';
import 'package:opening_doors/workplace.dart';

class workStyle2 extends StatefulWidget {

  @override
  State<workStyle2> createState() => _WorkStyleScreenState();
}

class _WorkStyleScreenState extends State<workStyle2> {
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
            buildOptionCard("Freelance", "Project-based work with the freedom to set your schedule and work from anywhere"),
            buildOptionCard("Part-Time", "Work fewer hours per week with flexible schedule tailored to specific tasks"),
            buildOptionCard("Fulltime", "Work on a regular 40-hour schedule with comprehensive duties and potential benefits"),

            Spacer(),

      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        
                IconButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> workStyle()));
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.orange),
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(),
                ),

         
                ElevatedButton(
                  onPressed: selectedOption != null ? () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> workplace()));
                  } : null, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedOption != null ? Colors.orange : Colors.grey,
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