import 'package:flutter/material.dart';
import 'package:hosthelp/home_screen.dart'; // or your main dashboard
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SelectRoomScreen extends StatefulWidget {
  final String name;
  final String hostel;

  const SelectRoomScreen({super.key, required this.name, required this.hostel});

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final _roomController = TextEditingController();
  final _rollController = TextEditingController();
  bool isSaving = false;

  void saveToFirestore() async {
  final room = _roomController.text.trim();
  final roll = _rollController.text.trim();

  if (room.isEmpty || roll.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill all fields")),
    );
    return;
  }

  setState(() => isSaving = true);

  try {
    // Save to Firestore
    await FirebaseFirestore.instance.collection('users').add({
      'name': widget.name,
      'hostel': widget.hostel,
      'room': room,
      'roll': roll,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', widget.name);
    await prefs.setString('hostel', widget.hostel);
    await prefs.setString('room', room);
    await prefs.setString('roll', roll);

    // Go to HomeScreen
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: ${e.toString()}")),
    );
  } finally {
    if (mounted) setState(() => isSaving = false);
  }
}



  @override
  void dispose() {
    _roomController.dispose();
    _rollController.dispose();
    super.dispose();
  }

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
              'Hi ${widget.name},',
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Room & Roll Number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            buildTextField(_roomController, 'Room Number'),
            const SizedBox(height: 24),
            buildTextField(_rollController, 'Roll Number'),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: isSaving ? null : saveToFirestore,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Finish Setup',
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

  Widget buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType:
          label.toLowerCase().contains('number') ? TextInputType.number : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
