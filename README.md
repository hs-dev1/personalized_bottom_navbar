Here's the updated `README.md` reflecting the changes from the `CHANGELOG.md`:


# Personalized Custom Bottom Navbar

A customizable bottom navigation bar package for Flutter that supports various styles and customization options using enums and custom widgets.

## Features

- Multiple navigation bar styles with `NavBarType` enums:

  - `textOnly`
  - `iconOnly`
  - `textIconTop`
  - `textIconBottom`
  - `textWithRoundedSelection`
  - `iconWithRoundedSelection`
  - `textIconHideUnselected`
  - `shadowEffectOnSelection`
  - `animationOnSelection`
  - `glowEffectOnSelection`

- Allows developers to pass custom widgets for more customization.
- Enhanced customization options with additional parameters:
  - `backgroundColor`
  - `elevation`
  - `fixedColor`
  - `iconSize`
  - `landscapeLayout`
  - `mouseCursor`
  - `selectedFontSize`
  - `selectedIconTheme`
  - `selectedItemColor`
  - `selectedLabelStyle`
  - `showSelectedLabels`
  - `showUnselectedLabels`
  - `unselectedFontSize`
  - `unselectedIconTheme`
  - `unselectedItemColor`
  - `unselectedLabelStyle`

## Getting Started

To start using the `personalized_bottom_navbar` package, add it to your `pubspec.yaml`:

```yaml
dependencies:
  personalized_bottom_navbar: ^0.0.2
```


Then run `flutter pub get` to install the package.

## Usage

Here is a basic example of how to use the `PersonalizedBottomNavBar`:

```dart
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

```

## Customization

The `PersonalizedBottomNavBar` widget provides various customization options to fit your needs. You can choose from different styles using the `NavBarType` enum and pass custom widgets to further customize the navigation bar. Additionally, new parameters have been introduced for more control over the appearance and behavior of the navigation bar.

### Available NavBar Types

- `textOnly`: Displays only text labels.
- `iconOnly`: Displays only icons.
- `textIconTop`: Displays icons with text labels above them.
- `textIconBottom`: Displays icons with text labels below them.
- `textWithRoundedSelection`: Displays text with a rounded indicator for the selected item.
- `iconWithRoundedSelection`: Displays icons with a rounded indicator for the selected item.
- `textIconHideUnselected`: Displays icons and text labels but hides labels for unselected items.
- `shadowEffectOnSelection`: Displays a shadow effect on the selected item.
- `animationOnSelection`: Animates the selected item.
- `glowEffectOnSelection`: Displays a glow effect on the selected item.

## Additional Information

For more details, check the [GitHub repository](https://github.com/hs-dev1/personalized_bottom_navbar/tree/master).

### Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to [open an issue](https://github.com/hs-dev1/personalized_bottom_navbar/issues) or submit a pull request.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
