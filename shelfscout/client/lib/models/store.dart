// TODO: Add json_serializable annotations and generate fromJson/toJson

class Store {
  final String id;
  final String name;
  final String address;
  final double lat;
  final double lng;
  final String regionId;
  final String? chain;

  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
    required this.regionId,
    this.chain,
  });
}
