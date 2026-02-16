import 'api_client.dart';

// TODO: Implement submission service

class SubmissionService {
  final ApiClient _api;

  SubmissionService(this._api);

  Future<void> createSubmission({
    required String storeId,
    required String itemId,
    required double price,
    required String photoPath,
  }) async {
    // TODO: POST /submissions with multipart photo upload
    throw UnimplementedError();
  }

  Future<List<dynamic>> getUserSubmissions() async {
    // TODO: GET /submissions/mine
    throw UnimplementedError();
  }

  Future<List<dynamic>> getStoreSubmissions(String storeId) async {
    // TODO: GET /submissions/store/:storeId
    throw UnimplementedError();
  }
}
