import 'api_client.dart';

// TODO: Implement store service

class StoreService {
  final ApiClient _api;

  StoreService(this._api);

  Future<List<dynamic>> getNearbyStores(double lat, double lng) async {
    // TODO: GET /stores/nearby?lat=&lng=
    throw UnimplementedError();
  }

  Future<dynamic> getStore(String id) async {
    // TODO: GET /stores/:id
    throw UnimplementedError();
  }

  Future<void> suggestStore(String name, String address, double lat, double lng) async {
    // TODO: POST /stores/suggest
    throw UnimplementedError();
  }
}
