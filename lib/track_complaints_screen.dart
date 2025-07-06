import 'package:flutter/material.dart';

class TrackComplaintsScreen extends StatelessWidget {
  const TrackComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> complaints = [
      {
        'category': 'Electrical',
        'description': 'Light not working in bathroom.',
        'status': 'Pending',
        'date': '2025-07-04'
      },
      {
        'category': 'Plumbing',
        'description': 'Tap leaking since morning.',
        'status': 'In Progress',
        'date': '2025-07-03'
      },
      {
        'category': 'Furniture',
        'description': 'Study chair leg is broken.',
        'status': 'Resolved',
        'date': '2025-07-01'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Complaints'),
        backgroundColor: const Color(0xFF6A5AE0),
      ),
      backgroundColor: const Color(0xFF1F1D2B),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return Card(
            color: Colors.white10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                complaint['category'] ?? '',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    complaint['description'] ?? '',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Date: ${complaint['date']}',
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
              trailing: _buildStatusBadge(complaint['status']),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusBadge(String? status) {
    Color badgeColor;
    switch (status) {
      case 'Pending':
        badgeColor = Colors.orangeAccent;
        break;
      case 'In Progress':
        badgeColor = Colors.blueAccent;
        break;
      case 'Resolved':
        badgeColor = Colors.green;
        break;
      default:
        badgeColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status ?? '',
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
