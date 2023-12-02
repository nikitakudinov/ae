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

List<String>? newCustomFunction2(List<dynamic>? jsonArray) {
  // delite dupblicates from jsonArray
  if (jsonArray == null) return null;

  final uniqueSet = <String>{};
  final result = <String>[];

  for (final item in jsonArray) {
    final jsonString = json.encode(item);
    if (uniqueSet.add(jsonString)) {
      result.add(jsonString);
    }
  }

  return result;
}

DateTime? newCustomFunction3(String? date) {
  // string to date
  if (date == null) {
    return null;
  }
  try {
    return DateFormat('yyyy-MM-dd h:m').parse(date);
  } catch (e) {
    return null;
  }
}

List<dynamic>? newCustomFunction4(List<dynamic>? jsonArray) {
  // convert values of price field to double format
  if (jsonArray == null) return null;

  final List<dynamic> result = [];

  for (final item in jsonArray) {
    if (item is Map<String, dynamic>) {
      final price = item['price'];
      if (price is String) {
        final doublePrice = double.tryParse(price.replaceAll(',', ''));
        if (doublePrice != null) {
          item['price'] = doublePrice;
        }
      }
    }
    result.add(item);
  }

  return result;
}

DateTime? stringDateToTommorow(String? datestring) {
  // convert datestring to datetime and add one day
  if (datestring == null) return null;
  final dateFormat = DateFormat('yyyy-MM-dd');
  final date = dateFormat.parse(datestring);
  final newDate = date.add(Duration(days: 1));
  return newDate;
}
