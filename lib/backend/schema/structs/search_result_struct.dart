// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultStruct extends BaseStruct {
  SearchResultStruct({
    String? offerKey,
    String? cross,
    String? brand,
    String? code,
    String? name,
    int? packing,
    String? price,
    String? currency,
    int? stock,
  })  : _offerKey = offerKey,
        _cross = cross,
        _brand = brand,
        _code = code,
        _name = name,
        _packing = packing,
        _price = price,
        _currency = currency,
        _stock = stock;

  // "offer_key" field.
  String? _offerKey;
  String get offerKey => _offerKey ?? '';
  set offerKey(String? val) => _offerKey = val;
  bool hasOfferKey() => _offerKey != null;

  // "cross" field.
  String? _cross;
  String get cross => _cross ?? '';
  set cross(String? val) => _cross = val;
  bool hasCross() => _cross != null;

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

  // "packing" field.
  int? _packing;
  int get packing => _packing ?? 0;
  set packing(int? val) => _packing = val;
  void incrementPacking(int amount) => _packing = packing + amount;
  bool hasPacking() => _packing != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;
  bool hasPrice() => _price != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;
  bool hasCurrency() => _currency != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  set stock(int? val) => _stock = val;
  void incrementStock(int amount) => _stock = stock + amount;
  bool hasStock() => _stock != null;

  static SearchResultStruct fromMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        offerKey: data['offer_key'] as String?,
        cross: data['cross'] as String?,
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        packing: castToType<int>(data['packing']),
        price: data['price'] as String?,
        currency: data['currency'] as String?,
        stock: castToType<int>(data['stock']),
      );

  static SearchResultStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SearchResultStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'offer_key': _offerKey,
        'cross': _cross,
        'brand': _brand,
        'code': _code,
        'name': _name,
        'packing': _packing,
        'price': _price,
        'currency': _currency,
        'stock': _stock,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'offer_key': serializeParam(
          _offerKey,
          ParamType.String,
        ),
        'cross': serializeParam(
          _cross,
          ParamType.String,
        ),
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
        'packing': serializeParam(
          _packing,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'stock': serializeParam(
          _stock,
          ParamType.int,
        ),
      }.withoutNulls;

  static SearchResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        offerKey: deserializeParam(
          data['offer_key'],
          ParamType.String,
          false,
        ),
        cross: deserializeParam(
          data['cross'],
          ParamType.String,
          false,
        ),
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
        packing: deserializeParam(
          data['packing'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        stock: deserializeParam(
          data['stock'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SearchResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultStruct &&
        offerKey == other.offerKey &&
        cross == other.cross &&
        brand == other.brand &&
        code == other.code &&
        name == other.name &&
        packing == other.packing &&
        price == other.price &&
        currency == other.currency &&
        stock == other.stock;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [offerKey, cross, brand, code, name, packing, price, currency, stock]);
}

SearchResultStruct createSearchResultStruct({
  String? offerKey,
  String? cross,
  String? brand,
  String? code,
  String? name,
  int? packing,
  String? price,
  String? currency,
  int? stock,
}) =>
    SearchResultStruct(
      offerKey: offerKey,
      cross: cross,
      brand: brand,
      code: code,
      name: name,
      packing: packing,
      price: price,
      currency: currency,
      stock: stock,
    );
