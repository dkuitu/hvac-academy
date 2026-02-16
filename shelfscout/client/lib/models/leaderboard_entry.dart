// TODO: Add json_serializable annotations and generate fromJson/toJson

class LeaderboardEntry {
  final int rank;
  final String userId;
  final String username;
  final int crownCount;
  final int totalCrownHours;
  final int submissionCount;

  LeaderboardEntry({
    required this.rank,
    required this.userId,
    required this.username,
    required this.crownCount,
    required this.totalCrownHours,
    required this.submissionCount,
  });
}
