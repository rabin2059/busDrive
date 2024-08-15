import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screens/bus_screen.dart';
import '../Screens/home_screen.dart';
import '../Screens/profile_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 1; // Default to HomeScreen
  final PageController _pageController = PageController(initialPage: 1);

  final List<Widget> _pages = <Widget>[
    const BusScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Widget _buildIconButton(
    IconData iconData,
    int index,
    bool isSelected,
  ) {
    return Material(
      color: Colors.transparent, // Ensure no background color is applied
      child: IconButton(
        onPressed: () => _onItemTapped(index),
        icon: Icon(
          iconData,
          size: isSelected ? 36.h : 26.h, // Increase size when selected
          color: isSelected ? const Color(0xFFFF725E) : Colors.grey,
        ),
        highlightColor: Colors.transparent, // Avoid color change on press
        splashColor: Colors.transparent,    // Avoid splash color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics:
                const NeverScrollableScrollPhysics(), // Disable swipe gestures
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 26.h,
            left: 0,
            right: 0,
            child: Center(
              child: Material(
                borderRadius: BorderRadius.circular(30), // Rounded corners
                child: Container(
                  height: 57.h,
                  width: 286.w,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIconButton(
                            CupertinoIcons.bus, 0, _selectedIndex == 0),
                        _buildIconButton(Icons.home, 1, _selectedIndex == 1),
                        _buildIconButton(CupertinoIcons.person_circle_fill, 2,
                            _selectedIndex == 2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
