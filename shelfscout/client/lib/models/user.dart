// TODO: Add json_serializable annotations and generate fromJson/toJson

class User {
  final String id;
  final String email;
  final String username;
  final String? regionId;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.username,
    this.regionId,
    required this.createdAt,
  });
}
