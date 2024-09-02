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

class PersonalizedBottomNavBar extends StatefulWidget {
  // CustomBottomNavBar({
  //   super.key,
  //   required this.type,
  //   required this.items,
  //   required this.currentIndex,
  //   required this.onTap,
  //   this.elevation,
  //   this.backgroundColor,
  //   this.iconSize = 24.0,
  //   Color? fixedColor,
  //   Color? selectedItemColora,
  //   this.unselectedItemColor,
  //   this.selectedIconTheme,
  //   this.unselectedIconTheme,
  //   this.selectedLabelStyle,
  //   this.unselectedLabelStyle,
  //   this.selectedFontSize = 14.0,
  //   this.unselectedFontSize = 12.0,
  //   this.showUnselectedLabels,
  //   this.showSelectedLabels,
  //   this.mouseCursor,
  //   this.enableFeedback,
  //   this.landscapeLayout,
  //   this.useLegacyColorScheme = true,
  // })  : assert(items.length >= 2),
  //       assert(
  //         items.every((BottomNavigationBarItem item) => item.label != null),
  //         'Every item must have a non-null label',
  //       ),
  //       assert(0 <= currentIndex && currentIndex < items.length),
  //       assert(elevation == null || elevation >= 0.0),
  //       assert(iconSize >= 0.0),
  //       assert(
  //         selectedItemColor == null || fixedColor == null,
  //         'Either selectedItemColor or fixedColor can be specified, but not both',
  //       ),
  //       assert(selectedFontSize >= 0.0),
  //       assert(unselectedFontSize >= 0.0);
  //       selectedItemColor = selectedItemColora ?? fixedColor;

  PersonalizedBottomNavBar({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
    this.elevation,
    required this.type,
    Color? fixedColor,
    this.backgroundColor,
    this.iconSize = 24.0,
    Color? selectedItemColor,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedFontSize = 14.0,
    this.unselectedFontSize = 12.0,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.mouseCursor,
    this.enableFeedback,
    this.landscapeLayout,
    this.textStyle,
    this.useLegacyColorScheme = true,
  })  : assert(items.length >= 2),
        assert(
          items.every((BottomNavigationBarItem item) => item.label != null),
          'Every item must have a non-null label',
        ),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(elevation == null || elevation >= 0.0),
        assert(iconSize >= 0.0),
        assert(
          selectedItemColor == null || fixedColor == null,
          'Either selectedItemColor or fixedColor can be specified, but not both',
        ),
        assert(selectedFontSize >= 0.0),
        assert(unselectedFontSize >= 0.0),
        selectedItemColor = selectedItemColor ?? fixedColor;

  final NavBarType type;
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final TextStyle? textStyle;

  /// The z-coordinate of this [BottomNavigationBar].
  ///
  /// If null, defaults to `8.0`.
  ///
  /// {@macro flutter.material.material.elevation}
  final double? elevation;

  /// Defines the layout and behavior of a [BottomNavigationBar].
  ///
  /// See documentation for [BottomNavigationBarType] for information on the
  /// meaning of different types.
  // final BottomNavigationBarType? type;

  /// The value of [selectedItemColor].
  ///
  /// This getter only exists for backwards compatibility, the
  /// [selectedItemColor] property is preferred.
  // Color? get fixedColor => selectedItemColor;

  /// The color of the [BottomNavigationBar] itself.
  ///
  /// If [type] is [BottomNavigationBarType.shifting] and the
  /// [items] have [BottomNavigationBarItem.backgroundColor] set, the [items]'
  /// backgroundColor will splash and overwrite this color.
  final Color? backgroundColor;

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// See [BottomNavigationBarItem.icon] for more information.
  final double iconSize;

  /// The color of the selected [BottomNavigationBarItem.icon] and
  /// [BottomNavigationBarItem.label].
  ///
  /// If null then the [ThemeData.primaryColor] is used.
  final Color? selectedItemColor;

  /// The color of the unselected [BottomNavigationBarItem.icon] and
  /// [BottomNavigationBarItem.label]s.
  ///
  /// If null then the [ThemeData.unselectedWidgetColor]'s color is used.
  final Color? unselectedItemColor;

  /// The size, opacity, and color of the icon in the currently selected
  /// [BottomNavigationBarItem.icon].
  ///
  /// If this is not provided, the size will default to [iconSize], the color
  /// will default to [selectedItemColor].
  ///
  /// It this field is provided, it must contain non-null [IconThemeData.size]
  /// and [IconThemeData.color] properties. Also, if this field is supplied,
  /// [unselectedIconTheme] must be provided.
  final IconThemeData? selectedIconTheme;

  /// The size, opacity, and color of the icon in the currently unselected
  /// [BottomNavigationBarItem.icon]s.
  ///
  /// If this is not provided, the size will default to [iconSize], the color
  /// will default to [unselectedItemColor].
  ///
  /// It this field is provided, it must contain non-null [IconThemeData.size]
  /// and [IconThemeData.color] properties. Also, if this field is supplied,
  /// [selectedIconTheme] must be provided.
  final IconThemeData? unselectedIconTheme;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are
  /// selected.
  final TextStyle? selectedLabelStyle;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are not
  /// selected.
  final TextStyle? unselectedLabelStyle;

  /// The font size of the [BottomNavigationBarItem] labels when they are selected.
  ///
  /// If [TextStyle.fontSize] of [selectedLabelStyle] is non-null, it will be
  /// used instead of this.
  ///
  /// Defaults to `14.0`.
  final double selectedFontSize;

  /// The font size of the [BottomNavigationBarItem] labels when they are not
  /// selected.
  ///
  /// If [TextStyle.fontSize] of [unselectedLabelStyle] is non-null, it will be
  /// used instead of this.
  ///
  /// Defaults to `12.0`.
  final double unselectedFontSize;

  /// Whether the labels are shown for the unselected [BottomNavigationBarItem]s.
  final bool? showUnselectedLabels;

  /// Whether the labels are shown for the selected [BottomNavigationBarItem].
  final bool? showSelectedLabels;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// items.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.selected].
  ///
  /// If null, then the value of [BottomNavigationBarThemeData.mouseCursor] is used. If
  /// that is also null, then [WidgetStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [WidgetStateMouseCursor], which can be used to create a [MouseCursor]
  ///    that is also a [MaterialStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// The arrangement of the bar's [items] when the enclosing
  /// [MediaQueryData.orientation] is [Orientation.landscape].
  ///
  /// The following alternatives are supported:
  ///
  /// * [BottomNavigationBarLandscapeLayout.spread] - the items are
  ///   evenly spaced and spread out across the available width. Each
  ///   item's label and icon are arranged in a column.
  /// * [BottomNavigationBarLandscapeLayout.centered] - the items are
  ///   evenly spaced in a row but only consume as much width as they
  ///   would in portrait orientation. The row of items is centered within
  ///   the available width. Each item's label and icon are arranged
  ///   in a column.
  /// * [BottomNavigationBarLandscapeLayout.linear] - the items are
  ///   evenly spaced and each item's icon and label are lined up in a
  ///   row instead of a column.
  ///
  /// If this property is null, then the value of the enclosing
  /// [BottomNavigationBarThemeData.landscapeLayout is used. If that
  /// property is also null, then
  /// [BottomNavigationBarLandscapeLayout.spread] is used.
  ///
  /// This property is null by default.
  ///
  /// See also:
  ///
  ///  * [ThemeData.bottomNavigationBarTheme] - which can be used to specify
  ///    bottom navigation bar defaults for an entire application.
  ///  * [BottomNavigationBarTheme] - which can be used to specify
  ///    bottom navigation bar defaults for a widget subtree.
  ///  * [MediaQuery.orientationOf] - which can be used to determine the current
  ///    orientation.
  final BottomNavigationBarLandscapeLayout? landscapeLayout;

  /// This flag is controlling how [BottomNavigationBar] is going to use
  /// the colors provided by the [selectedIconTheme], [unselectedIconTheme],
  /// [selectedItemColor], [unselectedItemColor].
  /// The default value is `true` as the new theming logic is a breaking change.
  /// To opt-in the new theming logic set the flag to `false`
  final bool useLegacyColorScheme;
  @override
  State<PersonalizedBottomNavBar> createState() => _PersonalizedBottomNavBarState();
}

class _PersonalizedBottomNavBarState extends State<PersonalizedBottomNavBar> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(covariant PersonalizedBottomNavBar oldWidget) {
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
    return _baseBottomNavBar().copyWith(
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
    return _baseBottomNavBar().copyWith(
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
    return _baseBottomNavBar().copyWith(
      items: widget.items.asMap().entries.map((e) {
        BottomNavigationBarItem item = e.value;
        int index = e.key;
        return BottomNavigationBarItem(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: textTop
                ? [
                    Text(
                      item.label ?? '',
                      style: widget.textStyle ??
                          TextStyle(
                            color: widget.currentIndex == index ? widget.selectedItemColor : widget.unselectedItemColor,
                          ),
                    ),
                    item.icon
                  ]
                : [
                    item.icon,
                    Text(
                      item.label ?? '',
                      style: widget.textStyle ??
                          TextStyle(
                            color: widget.currentIndex == index ? widget.selectedItemColor : widget.unselectedItemColor,
                          ),
                    ),
                  ],
          ),
          label: '',
        );
      }).toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildTextWithRoundedSelectionNavBar() {
    return _baseBottomNavBar().copyWith(
      items: widget.items.asMap().entries.map((e) {
        BottomNavigationBarItem item = e.value;
        int index = e.key;

        return BottomNavigationBarItem(
          icon: widget.currentIndex == widget.items.indexOf(item)
              ? Column(
                  children: [
                    Text(
                      item.label ?? '',
                      style: widget.textStyle ??
                          TextStyle(
                            color: widget.currentIndex == index ? widget.selectedItemColor : widget.unselectedItemColor,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.currentIndex == index ? widget.selectedItemColor : widget.unselectedItemColor,
                      ),
                    ),
                  ],
                )
              : Text(
                  item.label ?? '',
                  style: widget.textStyle ??
                      TextStyle(
                        color: widget.currentIndex == index ? widget.selectedItemColor : widget.unselectedItemColor,
                      ),
                ),
          label: '',
        );
      }).toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }

  Widget _buildIconWithRoundedSelectionNavBar() {
    return _baseBottomNavBar().copyWith(
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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.currentIndex == widget.items.indexOf(item) ? widget.selectedItemColor : widget.unselectedItemColor,
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
    return _baseBottomNavBar().copyWith(
      items: widget.items.map((item) {
        int index = widget.items.indexOf(item);
        return BottomNavigationBarItem(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon,
              if (widget.currentIndex == index)
                Text(
                  item.label ?? '',
                  style: widget.textStyle ??
                      TextStyle(
                        color: widget.currentIndex == index ? widget.selectedItemColor : widget.unselectedItemColor,
                      ),
                ),
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
    return _baseBottomNavBar().copyWith(
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
                      : const AlwaysStoppedAnimation(1.0),
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
    return _baseBottomNavBar().copyWith(
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
                              color:widget.selectedItemColor?.withOpacity(.2) ?? Colors.blue.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
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
    return _baseBottomNavBar().copyWith(
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
                              color:widget.selectedItemColor?.withOpacity(.2) ?? Colors.blue.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
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

  BottomNavigationBar _baseBottomNavBar() {
    return BottomNavigationBar(
      items: widget.items,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      // fixedColor: widget.fixedColor,
      iconSize: widget.iconSize,
      landscapeLayout: widget.landscapeLayout,
      mouseCursor: widget.mouseCursor,
      selectedFontSize: widget.selectedFontSize,
      selectedIconTheme: widget.selectedIconTheme,
      selectedItemColor: widget.selectedItemColor,
      selectedLabelStyle: widget.selectedLabelStyle,
      showSelectedLabels: widget.showSelectedLabels,
      showUnselectedLabels: widget.showUnselectedLabels,
      unselectedFontSize: widget.unselectedFontSize,
      unselectedIconTheme: widget.unselectedIconTheme,
      unselectedItemColor: widget.unselectedItemColor,
      unselectedLabelStyle: widget.unselectedLabelStyle,
    );
  }
}

extension BottomNavBarCopyWith on BottomNavigationBar {
  BottomNavigationBar copyWith({
    List<BottomNavigationBarItem>? items,
    int? currentIndex,
    ValueChanged<int>? onTap,
    Color? backgroundColor,
    double? elevation,
    Color? fixedColor,
    double? iconSize,
    BottomNavigationBarLandscapeLayout? landscapeLayout,
    MouseCursor? mouseCursor,
    double? selectedFontSize,
    IconThemeData? selectedIconTheme,
    Color? selectedItemColor,
    TextStyle? selectedLabelStyle,
    bool? showSelectedLabels,
    bool? showUnselectedLabels,
    double? unselectedFontSize,
    IconThemeData? unselectedIconTheme,
    Color? unselectedItemColor,
    TextStyle? unselectedLabelStyle,
  }) {
    return BottomNavigationBar(
      items: items ?? this.items,
      currentIndex: currentIndex ?? this.currentIndex,
      onTap: onTap ?? this.onTap,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      // fixedColor: fixedColor ?? this.fixedColor,
      iconSize: iconSize ?? this.iconSize,
      landscapeLayout: landscapeLayout ?? this.landscapeLayout,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      selectedFontSize: selectedFontSize ?? this.selectedFontSize,
      selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      selectedLabelStyle: selectedLabelStyle ?? this.selectedLabelStyle,
      showSelectedLabels: showSelectedLabels ?? this.showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels ?? this.showUnselectedLabels,
      unselectedFontSize: unselectedFontSize ?? this.unselectedFontSize,
      unselectedIconTheme: unselectedIconTheme ?? this.unselectedIconTheme,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
      unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
    );
  }
}
