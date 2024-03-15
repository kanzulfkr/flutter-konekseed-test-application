// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../data/datasources/target_remote_datasources.dart';

class TargetProvider extends ChangeNotifier {
  List<dynamic> _searchProduct = [];
  List<dynamic> get allProduct => _searchProduct;

  Future<void> getSearchProduct() async {
    var response = await TargetRemoteDataSources().getAllProductSearch();
    _searchProduct = response['data'];
    notifyListeners();
  }

  int? _productId;
  int? get getProductId => _productId;

  int? _targetsId;
  int? get getTargetsId => _targetsId;

  int? _businessId;
  int? get getBusinessId => _businessId;

  int? _weight;
  int? get getWeight => _weight;

  String? _startDate;
  String? get getStartDate => _startDate;

  String? _endDate;
  String? get getEndDate => _endDate;

  TextEditingController nameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  void setBusinessId(int? businessId) async {
    _businessId = businessId;
    notifyListeners();
  }

  void setTargetsId(int? id) async {
    _targetsId = id;
    notifyListeners();
  }

  void setProductId(int? id) async {
    _productId = id;
    notifyListeners();
  }

  void setWeightController(String value) async {
    weightController.text = value;
    notifyListeners();
  }

  void setStartDateController(String value) async {
    startDateController.text = value;
    notifyListeners();
  }

  void setEndDateController(String value) async {
    endDateController.text = value;
    notifyListeners();
  }

  void setNameController(String value) async {
    nameController.text = value;
    notifyListeners();
  }

  void setProductNameController(String value) {
    productNameController.text = value;
    notifyListeners();
  }

  void setCategoryController(String value) {
    categoryController.text = value;
    notifyListeners();
  }

  void setStatusController(String value) {
    statusController.text = value;
    notifyListeners();
  }

  // Future<void> storeTargets(
  //   String businessId,
  //   String productId,
  //   String name,
  //   String category,
  //   String weight,
  //   String startDate,
  //   String endDate,
  //   String status,
  // ) async {
  //   notifyListeners();
  //   try {
  //     await TargetRemoteDataSources().storeTargets(
  //       businessId,
  //       productId,
  //       name,
  //       category,
  //       weight,
  //       startDate,
  //       endDate,
  //       status,
  //     );
  //     notifyListeners();
  //   } catch (e) {
  //     print('Error : $e');
  //     notifyListeners();
  //   }
  // }

  Future<void> deleteTargets(int id) async {
    notifyListeners();
    try {
      await TargetRemoteDataSources().deleteTargets(id);
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      notifyListeners();
    }
  }
}
