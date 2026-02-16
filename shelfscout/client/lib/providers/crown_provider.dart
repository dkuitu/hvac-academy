import 'package:flutter/foundation.dart';
import '../models/crown.dart';

// TODO: Implement crown state management

class CrownProvider extends ChangeNotifier {
  List<Crown> _userCrowns = [];
  List<Crown> _regionCrowns = [];
  bool _isLoading = false;

  List<Crown> get userCrowns => _userCrowns;
  List<Crown> get regionCrowns => _regionCrowns;
  bool get isLoading => _isLoading;

  Future<void> loadUserCrowns() async {
    // TODO: Fetch crowns held by current user
    throw UnimplementedError();
  }

  Future<void> loadRegionCrowns(String regionId) async {
    // TODO: Fetch all crowns in a region
    throw UnimplementedError();
  }
}
