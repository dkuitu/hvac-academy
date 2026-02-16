// TODO: Add json_serializable annotations and generate fromJson/toJson

class Item {
  final String id;
  final String name;
  final String category;
  final bool active;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.active,
  });
}
