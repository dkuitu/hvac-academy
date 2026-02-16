import 'dart:math';

class GeoUtils {
  /// Calculate distance in meters between two lat/lng points (Haversine).
  static double distanceMeters(double lat1, double lng1, double lat2, double lng2) {
    const R = 6371e3;
    final dLat = _toRad(lat2 - lat1);
    final dLng = _toRad(lng2 - lng1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRad(lat1)) * cos(_toRad(lat2)) * sin(dLng / 2) * sin(dLng / 2);
    return R * 2 * atan2(sqrt(a), sqrt(1 - a));
  }

  static double _toRad(double deg) => deg * pi / 180;
}
