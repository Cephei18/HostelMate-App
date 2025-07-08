import 'package:flutter/material.dart';
import 'complaint_screen.dart';
import 'track_complaints_screen.dart';
import 'lostfound_screen.dart';
import 'ai_bot_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  String roll = '';
  String hostel = '';
  String room = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      roll = prefs.getString('roll') ?? '';
      hostel = prefs.getString('hostel') ?? '';
      room = prefs.getString('room') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Text(
                    'HostelMate',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Your AI-Powered Hostel Assistant',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 16),
                sectionLabel('👤 Your Profile'),
                profileCard(),
                const SizedBox(height: 16),
                sectionLabel('🏠 Hostel Details'),
                hostelCard(),
                const SizedBox(height: 20),
                sectionLabel('⚙️ Dashboard Tools'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _DashboardTile(
                        icon: Icons.build,
                        label: 'Submit Complaint',
                        color: Colors.deepPurpleAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ComplaintScreen(),
                            ),
                          );
                        },
                      ),
                      _DashboardTile(
                        icon: Icons.receipt_long,
                        label: 'Track Complaints',
                        color: Colors.lightBlueAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TrackComplaintsScreen(),
                            ),
                          );
                        },
                      ),
                      _DashboardTile(
                        icon: Icons.smart_toy,
                        label: 'Ask Hostel AI',
                        color: Colors.tealAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AIBotScreen(),
                            ),
                          );
                        },
                      ),
                      _DashboardTile(
                        icon: Icons.search,
                        label: 'Lost & Found',
                        color: Colors.purpleAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LostFoundScreen(),
                            ),
                          );
                        },
                      ),
                      _DashboardTile(
                        icon: Icons.notifications,
                        label: 'Hostel Calender',
                        color: Colors.orangeAccent,
                        onTap: () {
                          // Placeholder for notifications functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Calender feature coming soon!'),
                            ),
                          );
                        },
                      ),

                      
                      _DashboardTile(
                        icon: Icons.feedback,
                        label: 'Feedback',
                        color: const Color.fromARGB(255, 107, 148, 228),
                        onTap: () {
                          // Placeholder for notifications functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Feedback feature coming soon!'),
                            ),
                          );
                        },
                      ),
                      _DashboardTile(
                        icon: Icons.settings,
                        label: 'Settings',
                        color: Colors.greenAccent,
                        onTap: () {
                          // Placeholder for settings functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Settings feature coming soon!'),
                            ),
                          );
                        },
                      ),
                      //feedback form
                      _DashboardTile(
                        icon: Icons.food_bank,
                        label: 'Mess Details',
                        color: const Color.fromARGB(255, 216, 118, 243),
                        onTap: () {
                          // Placeholder for notifications functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Mess feature coming soon!'),
                            ),
                          );
                        },
                      ),
                      //Important Contacts
                      _DashboardTile(
                        icon: Icons.contact_phone,
                        label: 'Important Contacts',
                        color: Colors.redAccent,
                        onTap: () {
                          // Placeholder for important contacts functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Contacts feature coming soon!'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      '🧠 HostelMate – Your AI-Powered Hostel Assistant',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF6A5AE0), Color(0xFF8D74FF)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Roll No: $roll',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget hostelCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurpleAccent.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(26, 132, 83, 83),
        ),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hostel: $hostel',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Room No: $room',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 6),
            const Text(
              'Caretaker Mrs Parul: 900235610',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionLabel(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade300,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _DashboardTile({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.5)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
