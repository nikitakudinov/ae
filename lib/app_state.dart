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
