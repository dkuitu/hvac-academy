// TODO: Add json_serializable annotations and generate fromJson/toJson

enum SubmissionStatus { pending, verified, rejected }

class Submission {
  final String id;
  final String userId;
  final String storeId;
  final String itemId;
  final double price;
  final String photoUrl;
  final SubmissionStatus status;
  final DateTime submittedAt;
  final DateTime? verifiedAt;

  Submission({
    required this.id,
    required this.userId,
    required this.storeId,
    required this.itemId,
    required this.price,
    required this.photoUrl,
    required this.status,
    required this.submittedAt,
    this.verifiedAt,
  });
}
