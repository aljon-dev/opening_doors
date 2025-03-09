import 'package:flutter/material.dart';
import 'package:opening_doors/resume.dart';

class workplace extends StatefulWidget {
  @override
   State<workplace> createState() => _WorkplaceAccommodationScreenState();
}

class _WorkplaceAccommodationScreenState extends State< workplace > {
  List<String> accommodations = [
    "Wheelchair Accessibility", "Ergonomic Workspace", "Accessible Restrooms", "Adjustable Desk Height",
    "Wide Doorways", "Communication Devices", "Screen Reader Software", "Automatic Doors",
    "Memory Aids", "Written Communication Options", "Flexible Schedule", "High Contrast Display",
    "Magnification Software", "Voice Recognition"
  ];

  List<String> selectedItems = [];
  String searchQuery = "";

  void toggleSelection(String item) {
    setState(() {
      selectedItems.contains(item) ? selectedItems.remove(item) : selectedItems.add(item);
    });
  }

  void clearSelection() {
    setState(() {
      selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredList = accommodations
        .where((item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), 
            Text(
              "Workplace Accommodation Needs",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Select the accommodation you need in your workplace. Your selection will help employers prepare an inclusive environment for you.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 16),

            
            TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: "Enter your specific workplace needs",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            SizedBox(height: 16),

            
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: filteredList.map((item) {
                    bool isSelected = selectedItems.contains(item);
                    return GestureDetector(
                      onTap: () => toggleSelection(item),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.white,
                        ),
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(height: 16),

   
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
                  onPressed: clearSelection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Clear All"),
                ),

                // Continue Button
                ElevatedButton(
                  onPressed: selectedItems.isNotEmpty ? () {

                     Navigator.push(context, MaterialPageRoute(builder: (context)=> resume()));


                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedItems.isNotEmpty ? Colors.orange : Colors.grey,
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