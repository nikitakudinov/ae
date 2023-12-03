// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchRequestStruct extends BaseStruct {
  SearchRequestStruct({
    String? brand,
    String? code,
    String? name,
    DateTime? date,
  })  : _brand = brand,
        _code = code,
        _name = name,
        _date = date;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;
  bool hasBrand() => _brand != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;
  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static SearchRequestStruct fromMap(Map<String, dynamic> data) =>
      SearchRequestStruct(
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        date: data['date'] as DateTime?,
      );

  static SearchRequestStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SearchRequestStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'code': _code,
        'name': _name,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SearchRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchRequestStruct(
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SearchRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchRequestStruct &&
        brand == other.brand &&
        code == other.code &&
        name == other.name &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([brand, code, name, date]);
}

SearchRequestStruct createSearchRequestStruct({
  String? brand,
  String? code,
  String? name,
  DateTime? date,
}) =>
    SearchRequestStruct(
      brand: brand,
      code: code,
      name: name,
      date: date,
    );
