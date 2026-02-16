import 'package:flutter/foundation.dart';
import '../models/leaderboard_entry.dart';

// TODO: Implement leaderboard state management

class LeaderboardProvider extends ChangeNotifier {
  List<LeaderboardEntry> _entries = [];
  bool _isLoading = false;
  String _currentScope = 'regional';

  List<LeaderboardEntry> get entries => _entries;
  bool get isLoading => _isLoading;
  String get currentScope => _currentScope;

  Future<void> loadLeaderboard(String scope, {String? regionId}) async {
    // TODO: Fetch leaderboard based on scope
    throw UnimplementedError();
  }
}
