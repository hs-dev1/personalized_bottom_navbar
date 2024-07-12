import 'package:flutter_test/flutter_test.dart';
import 'package:custom_bottom_navbar/src/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CustomBottomNavBar test', (WidgetTester tester) async {
    int selectedIndex = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
            },
            type: NavBarType.textWithRoundedSelection,
          ),
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
  });
}
