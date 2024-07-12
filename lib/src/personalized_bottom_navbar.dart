import 'package:flutter/material.dart';
// personalized_bottom_navbar
enum NavBarType {
  textOnly,
  iconOnly,
  textIconTop,
  textIconBottom,
  textWithRoundedSelection,
  iconWithRoundedSelection,
  textIconHideUnselected,
  shadowEffectOnSelection,
  animationOnSelection,
  glowEffectOnSelection,
}

class CustomBottomNavBar extends StatefulWidget {
  final NavBarType type;
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.type,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavBar oldWidget) {
    if (widget.currentIndex != oldWidget.currentIndex) {
      _controller.forward().then((_) => _controller.reverse());
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case NavBarType.textOnly:
        return _buildTextOnlyNavBar();
      case NavBarType.iconOnly:
        return _buildIconOnlyNavBar();
      case NavBarType.textIconTop:
        return _buildTextIconNavBar(textTop: true);
      case NavBarType.textIconBottom:
        return _buildTextIconNavBar(textTop: false);
      case NavBarType.textWithRoundedSelection:
        return _buildTextWithRoundedSelectionNavBar();
      case NavBarType.iconWithRoundedSelection:
        return _buildIconWithRoundedSelectionNavBar();
      case NavBarType.textIconHideUnselected:
        return _buildTextIconHideUnselectedNavBar();
      case NavBarType.animationOnSelection:
        return _buildAnimationOnSelectionNavBar();
      case NavBarType.glowEffectOnSelection:
        return _buildGlowEffectOnSelectionNavBar();
      case NavBarType.shadowEffectOnSelection:
        return _buildShadowEffectOnSelectionNavBar();
      default:
        return Container();
    }
  }

  Widget _buildTextOnlyNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .map((item) => BottomNavigationBarItem(
                icon: const SizedBox.shrink(),
                label: item.label,
              ))
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildIconOnlyNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .map((item) => BottomNavigationBarItem(
                icon: item.icon,
                label: '',
              ))
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildTextIconNavBar({required bool textTop}) {
    return BottomNavigationBar(
      items: widget.items
          .map((item) => BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: textTop
                      ? [Text(item.label ?? ''), item.icon]
                      : [item.icon, Text(item.label ?? '')],
                ),
                label: '',
              ))
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildTextWithRoundedSelectionNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .map((item) => BottomNavigationBarItem(
                icon: widget.currentIndex == widget.items.indexOf(item)
                    ? Column(
                        children: [
                          Text(item.label ?? ''),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    : Text(item.label ?? ''),
                label: '',
              ))
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildIconWithRoundedSelectionNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .map((item) => BottomNavigationBarItem(
                icon: widget.currentIndex == widget.items.indexOf(item)
                    ? Column(
                        children: [
                          item.icon,
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    : item.icon,
                label: '',
              ))
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildTextIconHideUnselectedNavBar() {
    return BottomNavigationBar(
      items: widget.items.map((item) {
        int index = widget.items.indexOf(item);
        return BottomNavigationBarItem(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon,
              if (widget.currentIndex == index) Text(item.label ?? ''),
            ],
          ),
          label: '',
        );
      }).toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildAnimationOnSelectionNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .asMap()
          .map((index, item) => MapEntry(
              index,
              BottomNavigationBarItem(
                icon: ScaleTransition(
                  scale: widget.currentIndex == index
                      ? Tween<double>(begin: 1.0, end: 1.2).animate(
                          CurvedAnimation(
                            parent: _controller,
                            curve: Curves.easeInOut,
                          ),
                        )
                      : AlwaysStoppedAnimation(1.0),
                  child: item.icon,
                ),
                label: item.label,
              )))
          .values
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildGlowEffectOnSelectionNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .asMap()
          .map((index, item) => MapEntry(
              index,
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: widget.currentIndex == index
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            )
                          ]
                        : [],
                  ),
                  child: item.icon,
                ),
                label: item.label,
              )))
          .values
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildShadowEffectOnSelectionNavBar() {
    return BottomNavigationBar(
      items: widget.items
          .asMap()
          .map((index, item) => MapEntry(
              index,
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: widget.currentIndex == index
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            )
                          ]
                        : [],
                  ),
                  child: item.icon,
                ),
                label: item.label,
              )))
          .values
          .toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }
}

  // final List<CustomBottomNavBarItem> items;
  // final int currentIndex;
  // final ValueChanged<int> onTap;
  // final Color? backgroundColor;
  // final double iconSize;
  // final double selectedFontSize;
  // final double unselectedFontSize;
  // final Color? selectedItemColor;
  // final Color? unselectedItemColor;
  // final Duration animationDuration;
  // final Curve animationCurve;
  // final bool showIndicator;
  // final Color? indicatorColor;
  // final BottomNavigationBarType? type;
