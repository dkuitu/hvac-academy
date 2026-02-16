// TODO: Add json_serializable annotations and generate fromJson/toJson

enum ValidationVote { confirm, flag }

class ValidationItem {
  final String submissionId;
  final String photoUrl;
  final double claimedPrice;
  final String itemName;
  final String storeName;
  final int confirmCount;
  final int flagCount;

  ValidationItem({
    required this.submissionId,
    required this.photoUrl,
    required this.claimedPrice,
    required this.itemName,
    required this.storeName,
    required this.confirmCount,
    required this.flagCount,
  });
}
