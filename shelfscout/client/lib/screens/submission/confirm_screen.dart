import 'package:flutter/material.dart';

// TODO: Implement confirmation screen
// - Show captured photo
// - Display OCR-extracted price, item, store
// - Quick tap to confirm or re-capture

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Submission')),
      body: const Center(child: Text('Confirm Screen — TODO')),
    );
  }
}
