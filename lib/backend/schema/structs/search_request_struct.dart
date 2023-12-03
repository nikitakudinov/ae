// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchRequestStruct extends BaseStruct {
  SearchRequestStruct({
    String? brand,
    String? code,
    String? string,
  })  : _brand = brand,
        _code = code,
        _string = string;

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

  // "string" field.
  String? _string;
  String get string => _string ?? '';
  set string(String? val) => _string = val;
  bool hasString() => _string != null;

  static SearchRequestStruct fromMap(Map<String, dynamic> data) =>
      SearchRequestStruct(
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        string: data['string'] as String?,
      );

  static SearchRequestStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SearchRequestStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'code': _code,
        'string': _string,
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
        'string': serializeParam(
          _string,
          ParamType.String,
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
        string: deserializeParam(
          data['string'],
          ParamType.String,
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
        string == other.string;
  }

  @override
  int get hashCode => const ListEquality().hash([brand, code, string]);
}

SearchRequestStruct createSearchRequestStruct({
  String? brand,
  String? code,
  String? string,
}) =>
    SearchRequestStruct(
      brand: brand,
      code: code,
      string: string,
    );
