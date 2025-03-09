import 'package:flutter/material.dart';
import 'package:opening_doors/Chatdetail.dart';
import 'package:opening_doors/JobListingPage.dart';
import 'package:opening_doors/RecentJobs.dart';


class mainpage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<mainpage > {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomePage(),
    ApplicationsPage(),
    MessagesPage(),
    SettingsPage(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1E7A82),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.folder_outlined), label: "Applications"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("assets/profile.jpg"),
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, color: Colors.grey[600], size: 24),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Back", style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                          Text("Joel Ravanera", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.notifications_outlined, size: 24),
                ],
              ),
              
              SizedBox(height: 20),
              
         
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12),
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xFF1E7A82),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
       
              Text("Explore Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(icon: Icons.school, title: "Education & Training"),
                    SizedBox(width: 10),
                    CategoryCard(icon: Icons.attach_money, title: "Finance & Business"),
                  ],
                ),
              ),
              
              SizedBox(height: 20),
              
              
              SectionHeader(title: "Recent Jobs"),
              SizedBox(height: 10),
              JobCard(
                companyLogo: "D",
                companyName: "InnoTech Solutions",
                jobTitle: "Software Engineer",
                location: "General Trias, Cavite",
                jobType: "Part-time",
                workMode: "Remote",
                timePosted: "1 day ago",
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              JobCard(
                companyLogo: "D",
                companyName: "Tech Solutions",
                jobTitle: "Web Developer",
                location: "General Trias, Cavite",
                jobType: "Part-time",
                workMode: "Remote",
                timePosted: "1 day ago",
                color: Colors.blue,
              ),
              
              SizedBox(height: 20),
              
   
              SectionHeader(title: "Featured Jobs"),
              SizedBox(height: 10),
              JobCard(
                companyLogo: "D",
                companyName: "ByteForge Innovations",
                jobTitle: "Software Engineer",
                location: "General Trias, Cavite",
                jobType: "Full-time",
                workMode: "Onsite",
                timePosted: "1 day ago",
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              JobCard(
                companyLogo: "D",
                companyName: "NexaSoft",
                jobTitle: "Graphic Designer",
                location: "General Trias, Cavite",
                jobType: "Part-time",
                workMode: "Remote",
                timePosted: "1 day ago",
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ApplicationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
         
          children: [

              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Applications',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(width: 20,),
                  Icon(Icons.notifications_outlined, size: 30),
                ],
              ),
            ),

            const SizedBox(height: 10,),

            _buildApplicationCard(
              'Web Developer',
              'Tech Solutions Inc.',
              'February 14, 2025',
              '9:15 am',
              'pending',
            ),
            const SizedBox(height: 16),
            _buildApplicationCard(
              'Graphic Designer',
              'Creative Studio',
              'February 27, 2025',
              '11:45 am',
              'rejected',
            ),
            const SizedBox(height: 16),
            _buildApplicationCard(
              'Content Writer',
              'Digital Media',
              'March 5, 2025',
              '10:30 pm',
              'accepted',
            ),
            const SizedBox(height: 16),
            _buildApplicationCard(
              'Frontend Developer',
              'Web Solutions',
              'March 5, 2025',
              '1:45 pm',
              'pending',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(
    String jobTitle,
    String company,
    String date,
    String time,
    String status,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                jobTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildStatusChip(status),
            ],
          ),
          Text(
            company,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                date,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(width: 24),
              const Icon(
                Icons.access_time_outlined,
                size: 16,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color backgroundColor;
    String label = status[0].toUpperCase() + status.substring(1);

    switch (status) {
      case 'pending':
        backgroundColor = const Color(0xFFFFF44F);
        break;
      case 'rejected':
        backgroundColor = const Color(0xFFFF5252);
        break;
      case 'accepted':
        backgroundColor = const Color(0xFF4CAF50);
        break;
      default:
        backgroundColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Messages',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(width: 20,),
                  Icon(Icons.notifications_outlined, size: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Joel Ravanera',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildMessageItem(
              'assets/images/alex.jpg',
              'Alex Johnson',
              'Hey, did you get the latest update?',
              '2h ago',
              context: context
            ),
            _buildMessageItem(
              'assets/images/creative_studio.png',
              'Creative Studio',
              'Your application for the UI/UX Designer role is...',
              '6h ago',
              isCompany: true,
                context: context
            ),
            _buildMessageItem(
              'assets/images/digital_media.png',
              'Digital Media',
              'Congratulations! You\'ve been accepted...',
              '9h ago',
              isCompany: true,
                context: context
            ),
            _buildMessageItem(
              'assets/images/tech_solutions.png',
              'Tech Solutions',
              'Thank you for applying for the Software Engineer...',
              '17h ago',
              isCompany: true,
                context: context
            ),
            _buildMessageItem(
              'assets/images/web_solutions.png',
              'Web Solutions',
              'We\'ve received your application for the Backend...',
              '19h ago',
              isCompany: true,
                context: context
            ),
            _buildMessageItem(
              'assets/images/access_employment.png',
              'Access Employment',
              'New job openings for data entry specialist',
              '19h ago',
              isCompany: true,
                context: context
            ),
            _buildMessageItem(
              'assets/images/skillbridge.png',
              'SkillBridge',
              'Hiring: Customer service representatives',
              '23h ago',
              isCompany: true,
                context: context
            ),
            _buildMessageItem(
              'assets/images/talent_connect.png',
              'Talent Connect',
              'Explore remote opportunities today',
              '2d ago',
              isCompany: true,
                context: context
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(
    String imageAsset,
    String name,
    String message,
    String time, {
    bool isCompany = false,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> ChatDetailScreen(contactName:name, contactImageUrl: imageAsset)));
        },
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isCompany
              ? CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    imageAsset,
                    width: 30,
                    height: 30,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.business,
                      color: Colors.grey,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imageAsset),
                  backgroundColor: Colors.grey,
                ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               SizedBox(height: 30,),
            Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Settings',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(width: 20,),
                  Icon(Icons.notifications_outlined, size: 30),
                ],
              ),
            ),
              SizedBox(height: 10,),
            const Text(
              'User Settings',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
         
            _buildSettingsItem(
              context,
              Icons.person_outline,
              'Contact Info',
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              Icons.lock_outline,
              'Password & Security',
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              Icons.visibility_outlined,
              'Privacy preferences',
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              Icons.notifications_none_outlined,
              'Notification Settings',
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              Icons.brightness_6_outlined,
              'Display',
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),
            const Text(
              'Account management and control',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              context,
              'Sign Out',
              onTap: () {},
              isDanger: false,
            ),
            const SizedBox(height: 8),
            _buildActionButton(
              context,
              'Close Account',
              subtitle: 'This will permanently close your account',
              onTap: () {},
              isDanger: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title, {
    String? subtitle,
    required VoidCallback onTap,
    required bool isDanger,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          color: isDanger ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       
            _buildCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'Joel Ravanera',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'General Trias, Cavite',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.email, 'Email:', 'joelravanera@gmail.com'),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.phone, 'Phone number:', '+63 XXX XXX XXXX'),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // resume to 
            const Text(
              'Resume',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCard(
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF9966),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Resume_RavaneraJoel.pdf',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Uploaded on March 8, 2025',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '1 MB',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Skills Section
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCard(
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  SkillChip(label: 'Microsoft Office'),
                  SkillChip(label: 'Microsoft Excel'),
                  SkillChip(label: 'Web Application'),
                  SkillChip(label: 'Data Entry'),
                  SkillChip(label: 'Virtual Assistance'),
                  SkillChip(label: 'Web Design'),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Work Preferences
            const Text(
              'Work Preferences',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCard(
              Column(
                children: [
                  _buildPreferenceItem(
                    'Onsite',
                    'Preferred work setup',
                    const Color(0xFF2A7A8C),
                  ),
                  const SizedBox(height: 12),
                  _buildPreferenceItem(
                    'Full-time',
                    'Preferred job type',
                    const Color(0xFF2A7A8C),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Workplace Needs
            const Text(
              'Workplace Needs',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCard(
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  SkillChip(label: 'Assistive Technology'),
                  SkillChip(label: 'Flexible Work Schedule'),
                  SkillChip(label: 'Accessible Workspace'),
                  SkillChip(label: 'Communication Support'),
                  SkillChip(label: 'Personal Assistance'),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem(String title, String subtitle, Color color) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  CategoryCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.black),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 5),
          Text("50+ opportunities", style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.only(right: i == 2 ? 0 : 4),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.grey[300],
                    child: i == 2 ? Text('+', style: TextStyle(fontSize: 10, color: Colors.grey[600])) : null,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: (){
            if(title.contains('Recent Jobs')){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> RecentJobsPage()));
              
            }


            if(title.contains('Featured Jobs')){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> JobListingPage()));
            }
            

        }, child:   Text("See All", style: TextStyle(color: Colors.blue, fontSize: 14)),)
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String jobTitle;
  final String location;
  final String jobType;
  final String workMode;
  final String timePosted;
  final Color color;

  JobCard({
    required this.companyLogo,
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.jobType,
    required this.workMode,
    required this.timePosted,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  companyLogo,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        companyName,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    jobTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              jobType,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              workMode,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        timePosted,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}