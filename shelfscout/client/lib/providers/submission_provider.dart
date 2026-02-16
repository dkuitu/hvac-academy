import 'package:flutter/foundation.dart';
import '../models/submission.dart';

// TODO: Implement submission state management

class SubmissionProvider extends ChangeNotifier {
  List<Submission> _userSubmissions = [];
  bool _isLoading = false;
  bool _isSubmitting = false;

  List<Submission> get userSubmissions => _userSubmissions;
  bool get isLoading => _isLoading;
  bool get isSubmitting => _isSubmitting;

  Future<void> submitPrice({
    required String storeId,
    required String itemId,
    required double price,
    required String photoPath,
  }) async {
    // TODO: Upload photo, create submission
    throw UnimplementedError();
  }

  Future<void> loadUserSubmissions() async {
    // TODO: Fetch user's submissions
    throw UnimplementedError();
  }
}
