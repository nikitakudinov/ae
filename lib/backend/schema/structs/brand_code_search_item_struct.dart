// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandCodeSearchItemStruct extends BaseStruct {
  BrandCodeSearchItemStruct({
    String? brand,
    String? code,
    String? name,
  })  : _brand = brand,
        _code = code,
        _name = name;

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

  static BrandCodeSearchItemStruct fromMap(Map<String, dynamic> data) =>
      BrandCodeSearchItemStruct(
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
      );

  static BrandCodeSearchItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? BrandCodeSearchItemStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'code': _code,
        'name': _name,
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
      }.withoutNulls;

  static BrandCodeSearchItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BrandCodeSearchItemStruct(
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
      );

  @override
  String toString() => 'BrandCodeSearchItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BrandCodeSearchItemStruct &&
        brand == other.brand &&
        code == other.code &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([brand, code, name]);
}

BrandCodeSearchItemStruct createBrandCodeSearchItemStruct({
  String? brand,
  String? code,
  String? name,
}) =>
    BrandCodeSearchItemStruct(
      brand: brand,
      code: code,
      name: name,
    );
