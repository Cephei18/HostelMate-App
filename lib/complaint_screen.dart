import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  String? selectedCategory;
  final TextEditingController descriptionController = TextEditingController();

  final List<String> categories = [
    'Electrical',
    'Plumbing',
    'Furniture',
    'Wi-Fi',
    'Cleaning',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Complaint'),
        backgroundColor: const Color.fromARGB(255, 169, 163, 219),
      ),
      backgroundColor: const Color(0xFF1F1D2B),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Category',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[850],
              value: selectedCategory,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(),
              ),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(
                    category,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(),
                hintText: 'Describe the issue...',
                hintStyle: TextStyle(color: Colors.white38),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 196, 191, 228),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () async {
                  final category = selectedCategory;
                  final description = descriptionController.text;

                  if (category != null && description.isNotEmpty) {
                    print('📤 Submitting complaint...');
                    try {
                      await FirebaseFirestore.instance
                          .collection('complaints')
                          .add({
                            'category': category,
                            'description': description,
                            'status': 'Pending',
                            'timestamp': Timestamp.now(),
                          });

                      print('✅ Complaint added to Firestore.');

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Complaint submitted successfully'),
                        ),
                      );

                      setState(() {
                        selectedCategory = null;
                        descriptionController.clear();
                      });
                    } catch (e) {
                      print('❌ Firestore error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error submitting complaint: $e'),
                        ),
                      );
                    }
                  } else {
                    print('⚠️ Form incomplete');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please complete the form')),
                    );
                  }
                },

                child: const Text('Submit Complaint'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
