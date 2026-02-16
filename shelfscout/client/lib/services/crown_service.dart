import 'api_client.dart';

// TODO: Implement crown service

class CrownService {
  final ApiClient _api;

  CrownService(this._api);

  Future<List<dynamic>> getRegionCrowns(String regionId) async {
    // TODO: GET /crowns/region/:regionId
    throw UnimplementedError();
  }

  Future<List<dynamic>> getUserCrowns() async {
    // TODO: GET /crowns/mine
    throw UnimplementedError();
  }

  Future<List<dynamic>> getCrownHistory(String itemId) async {
    // TODO: GET /crowns/history/:itemId
    throw UnimplementedError();
  }
}
