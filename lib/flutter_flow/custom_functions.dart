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
  // in jsonArrat convert all float type values to string and replace all words "return" to word rt
  if (jsonArray == null) return null;

  final List<dynamic> newJsonArray = [];

  for (final item in jsonArray) {
    if (item is Map<String, dynamic>) {
      final Map<String, dynamic> newItem = {};
      item.forEach((key, value) {
        if (value is double) {
          newItem[key] = value.toString();
        } else if (value is String) {
          newItem[key] = value.replaceAll('return', 'rt');
        } else {
          newItem[key] = value;
        }
      });
      newJsonArray.add(newItem);
    } else {
      newJsonArray.add(item);
    }
  }

  return newJsonArray;
}
