import 'package:flutter/material.dart';

import '../data/datasources/business_remote_datasources.dart';

enum UpdateStatus { empty, loading, success, error }

class BusinessProvider extends ChangeNotifier {
  UpdateStatus _updateStatus = UpdateStatus.empty;
  UpdateStatus get updateStatus => _updateStatus;

  Future<void> updateStatusBusiness(int id, String status) async {
    _updateStatus = UpdateStatus.loading;
    notifyListeners();
    try {
      await BusinessRemoteDataSources().updateStatus(id, status);
      _updateStatus = UpdateStatus.success;
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      _updateStatus = UpdateStatus.error;
      notifyListeners();
    }
  }
}
