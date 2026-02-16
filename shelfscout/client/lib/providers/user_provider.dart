import 'package:flutter/foundation.dart';
import '../models/badge.dart';

// TODO: Implement user profile state management

class UserProvider extends ChangeNotifier {
  List<Badge> _badges = [];
  Map<String, dynamic> _stats = {};
  bool _isLoading = false;

  List<Badge> get badges => _badges;
  Map<String, dynamic> get stats => _stats;
  bool get isLoading => _isLoading;

  Future<void> loadBadges() async {
    // TODO: Fetch user badges
    throw UnimplementedError();
  }

  Future<void> loadStats() async {
    // TODO: Fetch user stats (crown count, submissions, streaks)
    throw UnimplementedError();
  }
}
