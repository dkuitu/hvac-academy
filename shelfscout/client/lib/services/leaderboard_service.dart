import 'api_client.dart';

// TODO: Implement leaderboard service

class LeaderboardService {
  final ApiClient _api;

  LeaderboardService(this._api);

  Future<List<dynamic>> getRegionalLeaderboard(String regionId) async {
    // TODO: GET /leaderboards/regional/:regionId
    throw UnimplementedError();
  }

  Future<List<dynamic>> getNationalLeaderboard() async {
    // TODO: GET /leaderboards/national
    throw UnimplementedError();
  }

  Future<List<dynamic>> getWeeklyLeaderboard() async {
    // TODO: GET /leaderboards/weekly
    throw UnimplementedError();
  }
}
