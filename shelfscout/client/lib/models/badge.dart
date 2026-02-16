// TODO: Add json_serializable annotations and generate fromJson/toJson

enum BadgeRarity { common, uncommon, rare, epic, legendary }

class Badge {
  final String id;
  final String name;
  final String description;
  final BadgeRarity rarity;
  final String iconUrl;
  final DateTime? earnedAt;

  Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    required this.iconUrl,
    this.earnedAt,
  });
}
