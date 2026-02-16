import 'package:flutter/material.dart';

// TODO: Implement validation queue screen
// - List of pending submissions to validate
// - Photo thumbnail, claimed price, item, store
// - Tap to open detail screen

class ValidationQueueScreen extends StatelessWidget {
  const ValidationQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validate')),
      body: const Center(child: Text('Validation Queue — TODO')),
    );
  }
}
