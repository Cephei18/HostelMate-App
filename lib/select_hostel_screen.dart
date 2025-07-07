import 'package:flutter/material.dart';
import 'select_room_screen.dart'; 

class SelectHostelScreen extends StatefulWidget {
  final String name;
  const SelectHostelScreen({super.key, required this.name});

  @override
  State<SelectHostelScreen> createState() => _SelectHostelScreenState();
}

class _SelectHostelScreenState extends State<SelectHostelScreen> {
  String? selectedHostel;
  final List<String> hostels = ['Hostel A', 'Hostel B', 'Hostel C', 'Hostel D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1C),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${widget.name}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Select Your Hostel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...hostels.map((hostel) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedHostel = hostel;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: selectedHostel == hostel
                          ? Colors.deepPurpleAccent.withOpacity(0.8)
                          : Colors.grey[900],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selectedHostel == hostel
                            ? Colors.deepPurpleAccent
                            : Colors.white12,
                        width: 2,
                      ),
                      boxShadow: selectedHostel == hostel
                          ? [
                              BoxShadow(
                                color: Colors.deepPurpleAccent.withOpacity(0.5),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              )
                            ]
                          : [],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          selectedHostel == hostel
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          hostel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: selectedHostel != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectRoomScreen(
                              name: widget.name,
                              hostel: selectedHostel!,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
