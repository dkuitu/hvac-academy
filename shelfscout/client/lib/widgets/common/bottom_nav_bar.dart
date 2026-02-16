import 'package:flutter/material.dart';

// TODO: Implement bottom navigation bar
// Tabs: Map, Submit, Validate, Leaderboard, Profile

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Submit'),
        BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Validate'),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Ranks'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
