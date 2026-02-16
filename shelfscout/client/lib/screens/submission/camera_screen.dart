import 'package:flutter/material.dart';

// TODO: Implement camera screen for price tag capture
// - Camera preview with overlay guide
// - Capture button with haptic feedback
// - Navigate to confirm screen on capture

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snap Price Tag')),
      body: const Center(child: Text('Camera Screen — TODO')),
    );
  }
}
