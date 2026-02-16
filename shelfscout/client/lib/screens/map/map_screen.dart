import 'package:flutter/material.dart';

// TODO: Implement primary game interface
// - Google Map with store pins (unscouted, scouted, crowned, contested)
// - GPS tracking for current position
// - Store detail bottom sheet on pin tap
// - Filter bar for items
// - Heat zones for player activity density

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ShelfScout')),
      body: const Center(child: Text('Map Screen — TODO')),
    );
  }
}
