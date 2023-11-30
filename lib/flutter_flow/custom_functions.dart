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
