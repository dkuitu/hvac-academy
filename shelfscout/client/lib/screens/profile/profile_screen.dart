import 'package:flutter/material.dart';

// TODO: Implement player profile screen
// - Username, title, avatar
// - Crown count, submission count, streaks
// - Regional dominance indicators
// - Badge showcase

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Screen — TODO')),
    );
  }
}
