// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<BrandCodeSearchItemStruct>?> jsonBrandCodeSearchResult(
    List<dynamic>? jsonArray) async {
  // Add your function code here!
  List<BrandCodeSearchItemStruct> listOfStruct = [];
  for (var item in jsonArray!) {
    listOfStruct.add(BrandCodeSearchItemStruct.fromMap(item));
  }
  return listOfStruct;
}
