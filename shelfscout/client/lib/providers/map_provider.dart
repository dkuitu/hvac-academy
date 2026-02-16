import 'package:flutter/foundation.dart';
import '../models/store.dart';

// TODO: Implement map state management

class MapProvider extends ChangeNotifier {
  List<Store> _stores = [];
  bool _isLoading = false;
  double _currentLat = 0;
  double _currentLng = 0;

  List<Store> get stores => _stores;
  bool get isLoading => _isLoading;
  double get currentLat => _currentLat;
  double get currentLng => _currentLng;

  Future<void> loadNearbyStores(double lat, double lng) async {
    // TODO: Fetch stores within viewport, update pins
    throw UnimplementedError();
  }

  Future<void> updatePosition(double lat, double lng) async {
    _currentLat = lat;
    _currentLng = lng;
    notifyListeners();
  }
}
