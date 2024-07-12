// import 'package:example/navbar.dart';
// import 'package:flutter/material.dart';

// class TestClass extends StatefulWidget {
//   const TestClass({super.key});

//   @override
//   State<TestClass> createState() => _TestClassState();
// }

// class _TestClassState extends State<TestClass> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final List<String> labels = ['Home', 'Search', 'Profile'];
//   final List<IconData> icons = [Icons.home, Icons.search, Icons.person];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Column(
//               children: [
//                 ...List.generate(
//                   100,
//                   (index) => Text(index.toString()),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: CustomBottomNavBar(
//                 items: Iterable<int>.generate(labels.length)
//                     .map((index) => BottomNavigationBarItem(
//                           icon: Icon(icons[index]),
//                           label: labels[index],
//                         ))
//                     .toList(),
//                 currentIndex: _selectedIndex,
//                 onTap: _onItemTapped,
//                 type: NavBarType.iconWithRoundedSelection,
//               ),
//             ),
//             const SizedBox(height: 12),
//           ],
//         ),
//       ),
//       // bottomNavigationBar:
//     );
//   }
// }
