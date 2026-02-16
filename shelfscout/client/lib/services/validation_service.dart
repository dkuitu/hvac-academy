import 'api_client.dart';

// TODO: Implement validation service

class ValidationService {
  final ApiClient _api;

  ValidationService(this._api);

  Future<List<dynamic>> getValidationQueue() async {
    // TODO: GET /validation/queue
    throw UnimplementedError();
  }

  Future<void> submitValidation(String submissionId, String vote, {String? reason}) async {
    // TODO: POST /validation/:submissionId
    throw UnimplementedError();
  }

  Future<dynamic> getValidationStats() async {
    // TODO: GET /validation/stats
    throw UnimplementedError();
  }
}
