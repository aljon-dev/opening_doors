import 'package:flutter/material.dart';
import 'package:opening_doors/workStyle.dart';

class Skillset extends StatefulWidget {
  @override
  _SelectSkillsScreenState createState() => _SelectSkillsScreenState();
}

class _SelectSkillsScreenState extends State< Skillset> {
  List<String> allSkills = [
    "Microsoft Office", "Microsoft Excel", "Web Application",
    "Backend Development", "Web Design", "Video Editing",
    "Graphic Design", "Motion Graphics", "Digital Marketing",
    "Data Management", "Programming", "Online Tutoring",
    "Virtual Assistance", "Data Entry", "Technical Support",
    "Database Management", "Front end Development"
  ];
  
  List<String> filteredSkills = [];
  List<String> selectedSkills = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSkills = List.from(allSkills);
  }

  void filterSkills(String query) {
    setState(() {
      filteredSkills = allSkills
          .where((skill) => skill.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleSkill(String skill) {
    setState(() {
      if (selectedSkills.contains(skill)) {
        selectedSkills.remove(skill);
      } else {
        selectedSkills.add(skill);
      }
    });
  }

  void clearSelection() {
    setState(() {
      selectedSkills.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Your Skills", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 5),
            Text(
              "Your skills unlock opportunities, showing clients what you bring to the table and helping us connect you with the right jobs.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
           
            TextField(
              controller: searchController,
              onChanged: filterSkills,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),

       
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: filteredSkills.map((skill) {
                    bool isSelected = selectedSkills.contains(skill);
                    return GestureDetector(
                      onTap: () => toggleSkill(skill),
                      child: Chip(
                        label: Text(skill),
                        backgroundColor: isSelected ? Colors.orange : Colors.white,
                        
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.orange),
                        ),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.orange,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back, color: Colors.orange),
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(),
                ),

            
                ElevatedButton(
                  onPressed: clearSelection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Clear All"),
                ),

              
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>workStyle()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
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