import 'api_client.dart';

// TODO: Implement map service

class MapService {
  final ApiClient _api;

  MapService(this._api);

  Future<dynamic> getMapData({
    required double neLat,
    required double neLng,
    required double swLat,
    required double swLng,
  }) async {
    // TODO: GET /maps/data?neLat=&neLng=&swLat=&swLng=
    throw UnimplementedError();
  }

  Future<dynamic> getHeatmap(String regionId) async {
    // TODO: GET /maps/heatmap?regionId=
    throw UnimplementedError();
  }
}
