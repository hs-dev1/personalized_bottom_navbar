// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:personalized_bottom_navbar/personalized_bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personalized Bottom Navbar Example')),
      body: Center(child: Text('Selected Index: $_currentIndex')),
      bottomNavigationBar: PersonalizedBottomNavBar(
        type: NavBarType.shadowEffectOnSelection,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Example of additional parameters:
        elevation: 8.0,
        iconSize: 30.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
      ),
    );
  }
}
