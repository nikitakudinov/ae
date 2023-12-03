import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<BrandCodeSearchItemStruct> _BrandCodeSearchResults = [];
  List<BrandCodeSearchItemStruct> get BrandCodeSearchResults =>
      _BrandCodeSearchResults;
  set BrandCodeSearchResults(List<BrandCodeSearchItemStruct> _value) {
    _BrandCodeSearchResults = _value;
  }

  void addToBrandCodeSearchResults(BrandCodeSearchItemStruct _value) {
    _BrandCodeSearchResults.add(_value);
  }

  void removeFromBrandCodeSearchResults(BrandCodeSearchItemStruct _value) {
    _BrandCodeSearchResults.remove(_value);
  }

  void removeAtIndexFromBrandCodeSearchResults(int _index) {
    _BrandCodeSearchResults.removeAt(_index);
  }

  void updateBrandCodeSearchResultsAtIndex(
    int _index,
    BrandCodeSearchItemStruct Function(BrandCodeSearchItemStruct) updateFn,
  ) {
    _BrandCodeSearchResults[_index] = updateFn(_BrandCodeSearchResults[_index]);
  }

  void insertAtIndexInBrandCodeSearchResults(
      int _index, BrandCodeSearchItemStruct _value) {
    _BrandCodeSearchResults.insert(_index, _value);
  }

  List<SearchResultStruct> _sr = [];
  List<SearchResultStruct> get sr => _sr;
  set sr(List<SearchResultStruct> _value) {
    _sr = _value;
  }

  void addToSr(SearchResultStruct _value) {
    _sr.add(_value);
  }

  void removeFromSr(SearchResultStruct _value) {
    _sr.remove(_value);
  }

  void removeAtIndexFromSr(int _index) {
    _sr.removeAt(_index);
  }

  void updateSrAtIndex(
    int _index,
    SearchResultStruct Function(SearchResultStruct) updateFn,
  ) {
    _sr[_index] = updateFn(_sr[_index]);
  }

  void insertAtIndexInSr(int _index, SearchResultStruct _value) {
    _sr.insert(_index, _value);
  }

  List<String> _brands = [];
  List<String> get brands => _brands;
  set brands(List<String> _value) {
    _brands = _value;
  }

  void addToBrands(String _value) {
    _brands.add(_value);
  }

  void removeFromBrands(String _value) {
    _brands.remove(_value);
  }

  void removeAtIndexFromBrands(int _index) {
    _brands.removeAt(_index);
  }

  void updateBrandsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _brands[_index] = updateFn(_brands[_index]);
  }

  void insertAtIndexInBrands(int _index, String _value) {
    _brands.insert(_index, _value);
  }

  List<SearchRequestStruct> _searchRequests = [];
  List<SearchRequestStruct> get searchRequests => _searchRequests;
  set searchRequests(List<SearchRequestStruct> _value) {
    _searchRequests = _value;
  }

  void addToSearchRequests(SearchRequestStruct _value) {
    _searchRequests.add(_value);
  }

  void removeFromSearchRequests(SearchRequestStruct _value) {
    _searchRequests.remove(_value);
  }

  void removeAtIndexFromSearchRequests(int _index) {
    _searchRequests.removeAt(_index);
  }

  void updateSearchRequestsAtIndex(
    int _index,
    SearchRequestStruct Function(SearchRequestStruct) updateFn,
  ) {
    _searchRequests[_index] = updateFn(_searchRequests[_index]);
  }

  void insertAtIndexInSearchRequests(int _index, SearchRequestStruct _value) {
    _searchRequests.insert(_index, _value);
  }

  bool _SEARCHHISTORYvisibility = false;
  bool get SEARCHHISTORYvisibility => _SEARCHHISTORYvisibility;
  set SEARCHHISTORYvisibility(bool _value) {
    _SEARCHHISTORYvisibility = _value;
  }

  bool _SEARCHBRANDCODEvisibility = false;
  bool get SEARCHBRANDCODEvisibility => _SEARCHBRANDCODEvisibility;
  set SEARCHBRANDCODEvisibility(bool _value) {
    _SEARCHBRANDCODEvisibility = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
