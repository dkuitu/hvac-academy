// TODO: Add json_serializable annotations and generate fromJson/toJson

enum CrownStatus { active, contested, archived }

class Crown {
  final String id;
  final String itemId;
  final String regionId;
  final String holderId;
  final double lowestPrice;
  final CrownStatus status;
  final DateTime claimedAt;

  Crown({
    required this.id,
    required this.itemId,
    required this.regionId,
    required this.holderId,
    required this.lowestPrice,
    required this.status,
    required this.claimedAt,
  });
}
