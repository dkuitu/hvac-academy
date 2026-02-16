import 'package:flutter/foundation.dart';
import '../models/validation.dart';

// TODO: Implement validation state management

class ValidationProvider extends ChangeNotifier {
  List<ValidationItem> _queue = [];
  bool _isLoading = false;

  List<ValidationItem> get queue => _queue;
  bool get isLoading => _isLoading;

  Future<void> loadQueue() async {
    // TODO: Fetch pending submissions for validation
    throw UnimplementedError();
  }

  Future<void> submitVote(String submissionId, ValidationVote vote, {String? reason}) async {
    // TODO: Submit validation vote
    throw UnimplementedError();
  }
}
