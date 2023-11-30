import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<dynamic>? returnReplacer(List<dynamic>? input) {
  // in input json replace word "return" to word "vozvrat"
  if (input == null) return null;

  final jsonString = json.encode(input);
  final newJsonString = jsonString.replaceAll('return', 'vozvrat');
  final newJson = json.decode(newJsonString);
  return newJson;
}

List<dynamic>? newCustomFunction(List<dynamic>? jsonArray) {
  // convert all float values to double replace values  "return" to rt
  if (jsonArray == null) return null;

  final List<dynamic> newList = [];

  for (final item in jsonArray) {
    if (item is List<dynamic>) {
      newList.add(newCustomFunction(item));
    } else if (item is Map<String, dynamic>) {
      final Map<String, dynamic> newMap = {};
      item.forEach((key, value) {
        if (value is num) {
          newMap[key] = value.toDouble();
        } else if (value is String && value.toLowerCase() == 'return') {
          newMap[key] = 'rt';
        } else {
          newMap[key] = value;
        }
      });
      newList.add(newMap);
    } else if (item is String && item.toLowerCase() == 'return') {
      newList.add('rt');
    } else {
      newList.add(item);
    }
  }

  return newList;
}
