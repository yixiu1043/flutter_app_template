import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yx_app/gen/assets.gen.dart';

import 'app_pages.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({super.key, required this.child});

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _selectedIndex = 0;

  final bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        Assets.image.home.iconTabMain.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        Assets.image.home.iconTabMainSelected.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        Assets.image.home.iconTabPromotion.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        Assets.image.home.iconTabPromotionSelected.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      label: 'PROMOTION',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        Assets.image.home.iconTabMine.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        Assets.image.home.iconTabMineSelected.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      label: 'MINE',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: bottomNavigationBarItems,
        onTap: (index) => _tap(context, index),
      ),
    );
  }

  void _tap(BuildContext context, int index) {
    setState(() => _selectedIndex = index); // used for the highlighted state
    // navigate to the target route based on the tab index
    if (index == 0) {
      context.goNamed(Routes.HOME);
    } else if (index == 1) {
      context.goNamed(Routes.PROMOTION);
    } else if (index == 2) {
      context.goNamed(Routes.MINE);
    }
  }
}
