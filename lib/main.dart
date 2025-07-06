import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const HostelHelpApp());
}

class HostelHelpApp extends StatelessWidget {
  const HostelHelpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HostelHelp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // points to your clean new screen
    );
  }
}
