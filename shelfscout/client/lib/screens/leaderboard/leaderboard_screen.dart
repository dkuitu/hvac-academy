import 'package:flutter/material.dart';

// TODO: Implement leaderboard screen
// - Tab bar: Regional / National / Weekly
// - Ranked list of players
// - Current user highlight
// - Crown count, crown-hours, submission volume

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: const Center(child: Text('Leaderboard Screen — TODO')),
    );
  }
}
