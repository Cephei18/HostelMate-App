import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Name
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
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 👤 Profile Section
            sectionLabel('👤 Your Profile'),
            profileCard(),

            const SizedBox(height: 16),

            // 🏠 Hostel Info Section
            sectionLabel('🏠 Hostel Details'),
            hostelCard(),

            const SizedBox(height: 20),

            // ⚙️ Tools
            sectionLabel('⚙️ Dashboard Tools'),

            // Tiles
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _DashboardTile(
                      icon: Icons.build,
                      label: 'Submit Complaint',
                      color: Colors.deepPurpleAccent,
                      onTap: () {
                        // navigation
                      },
                    ),
                    _DashboardTile(
                      icon: Icons.search,
                      label: 'Lost & Found',
                      color: Colors.purpleAccent,
                      onTap: () {
                        // navigation
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Footer
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
            )
          ],
        ),
      ),
    );
  }

  // 👤 Profile Card Widget
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
              children: const [
                Text(
                  'Gopika Chauhan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Roll No: B21000XXX',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // 🏠 Hostel Card Widget
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
          children: const [
            Text(
              'Hostel: Gaurikund Girls Hostel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Room No: G-314',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 6),
            Text(
              'Caretaker: 98******10',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  // Section Label
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

// 🔘 Tile Widget
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
