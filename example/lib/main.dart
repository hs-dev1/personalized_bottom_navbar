// ignore_for_file: library_private_types_in_public_api

import 'package:custom_bottom_navbar/nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData.dark(useMaterial3: true),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> labels = ['Home', 'Search', 'Profile'];
  final List<IconData> icons = [Icons.home, Icons.search, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Tab $_selectedIndex'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        items: Iterable<int>.generate(labels.length)
            .map((index) => BottomNavigationBarItem(
                  icon: Icon(icons[index]),
                  label: labels[index],
                ))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: NavBarType.iconWithRoundedSelection,
      ),
    );
  }
}
