// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullSearchResultItemStruct extends BaseStruct {
  FullSearchResultItemStruct({
    String? offerKey,
    int? stock,
    int? cross,
    String? brand,
    String? code,
    String? name,
    int? packing,
    String? price,
    String? currency,
    int? amount,
    String? unit,
    String? vozvrat,
    String? deliveryTime,
    String? deliveryTimeMax,
    String? rejects,
    String? dealer,
    String? warehouseName,
    String? warehouseKey,
  })  : _offerKey = offerKey,
        _stock = stock,
        _cross = cross,
        _brand = brand,
        _code = code,
        _name = name,
        _packing = packing,
        _price = price,
        _currency = currency,
        _amount = amount,
        _unit = unit,
        _vozvrat = vozvrat,
        _deliveryTime = deliveryTime,
        _deliveryTimeMax = deliveryTimeMax,
        _rejects = rejects,
        _dealer = dealer,
        _warehouseName = warehouseName,
        _warehouseKey = warehouseKey;

  // "offer_key" field.
  String? _offerKey;
  String get offerKey => _offerKey ?? '';
  set offerKey(String? val) => _offerKey = val;
  bool hasOfferKey() => _offerKey != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  set stock(int? val) => _stock = val;
  void incrementStock(int amount) => _stock = stock + amount;
  bool hasStock() => _stock != null;

  // "cross" field.
  int? _cross;
  int get cross => _cross ?? 0;
  set cross(int? val) => _cross = val;
  void incrementCross(int amount) => _cross = cross + amount;
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

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;
  void incrementAmount(int amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "vozvrat" field.
  String? _vozvrat;
  String get vozvrat => _vozvrat ?? '';
  set vozvrat(String? val) => _vozvrat = val;
  bool hasVozvrat() => _vozvrat != null;

  // "delivery_time" field.
  String? _deliveryTime;
  String get deliveryTime => _deliveryTime ?? '';
  set deliveryTime(String? val) => _deliveryTime = val;
  bool hasDeliveryTime() => _deliveryTime != null;

  // "delivery_time_max" field.
  String? _deliveryTimeMax;
  String get deliveryTimeMax => _deliveryTimeMax ?? '';
  set deliveryTimeMax(String? val) => _deliveryTimeMax = val;
  bool hasDeliveryTimeMax() => _deliveryTimeMax != null;

  // "rejects" field.
  String? _rejects;
  String get rejects => _rejects ?? '';
  set rejects(String? val) => _rejects = val;
  bool hasRejects() => _rejects != null;

  // "dealer" field.
  String? _dealer;
  String get dealer => _dealer ?? '';
  set dealer(String? val) => _dealer = val;
  bool hasDealer() => _dealer != null;

  // "warehouse_name" field.
  String? _warehouseName;
  String get warehouseName => _warehouseName ?? '';
  set warehouseName(String? val) => _warehouseName = val;
  bool hasWarehouseName() => _warehouseName != null;

  // "warehouse_key" field.
  String? _warehouseKey;
  String get warehouseKey => _warehouseKey ?? '';
  set warehouseKey(String? val) => _warehouseKey = val;
  bool hasWarehouseKey() => _warehouseKey != null;

  static FullSearchResultItemStruct fromMap(Map<String, dynamic> data) =>
      FullSearchResultItemStruct(
        offerKey: data['offer_key'] as String?,
        stock: castToType<int>(data['stock']),
        cross: castToType<int>(data['cross']),
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        packing: castToType<int>(data['packing']),
        price: data['price'] as String?,
        currency: data['currency'] as String?,
        amount: castToType<int>(data['amount']),
        unit: data['unit'] as String?,
        vozvrat: data['vozvrat'] as String?,
        deliveryTime: data['delivery_time'] as String?,
        deliveryTimeMax: data['delivery_time_max'] as String?,
        rejects: data['rejects'] as String?,
        dealer: data['dealer'] as String?,
        warehouseName: data['warehouse_name'] as String?,
        warehouseKey: data['warehouse_key'] as String?,
      );

  static FullSearchResultItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? FullSearchResultItemStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'offer_key': _offerKey,
        'stock': _stock,
        'cross': _cross,
        'brand': _brand,
        'code': _code,
        'name': _name,
        'packing': _packing,
        'price': _price,
        'currency': _currency,
        'amount': _amount,
        'unit': _unit,
        'vozvrat': _vozvrat,
        'delivery_time': _deliveryTime,
        'delivery_time_max': _deliveryTimeMax,
        'rejects': _rejects,
        'dealer': _dealer,
        'warehouse_name': _warehouseName,
        'warehouse_key': _warehouseKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'offer_key': serializeParam(
          _offerKey,
          ParamType.String,
        ),
        'stock': serializeParam(
          _stock,
          ParamType.int,
        ),
        'cross': serializeParam(
          _cross,
          ParamType.int,
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
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'vozvrat': serializeParam(
          _vozvrat,
          ParamType.String,
        ),
        'delivery_time': serializeParam(
          _deliveryTime,
          ParamType.String,
        ),
        'delivery_time_max': serializeParam(
          _deliveryTimeMax,
          ParamType.String,
        ),
        'rejects': serializeParam(
          _rejects,
          ParamType.String,
        ),
        'dealer': serializeParam(
          _dealer,
          ParamType.String,
        ),
        'warehouse_name': serializeParam(
          _warehouseName,
          ParamType.String,
        ),
        'warehouse_key': serializeParam(
          _warehouseKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static FullSearchResultItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FullSearchResultItemStruct(
        offerKey: deserializeParam(
          data['offer_key'],
          ParamType.String,
          false,
        ),
        stock: deserializeParam(
          data['stock'],
          ParamType.int,
          false,
        ),
        cross: deserializeParam(
          data['cross'],
          ParamType.int,
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
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        vozvrat: deserializeParam(
          data['vozvrat'],
          ParamType.String,
          false,
        ),
        deliveryTime: deserializeParam(
          data['delivery_time'],
          ParamType.String,
          false,
        ),
        deliveryTimeMax: deserializeParam(
          data['delivery_time_max'],
          ParamType.String,
          false,
        ),
        rejects: deserializeParam(
          data['rejects'],
          ParamType.String,
          false,
        ),
        dealer: deserializeParam(
          data['dealer'],
          ParamType.String,
          false,
        ),
        warehouseName: deserializeParam(
          data['warehouse_name'],
          ParamType.String,
          false,
        ),
        warehouseKey: deserializeParam(
          data['warehouse_key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FullSearchResultItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FullSearchResultItemStruct &&
        offerKey == other.offerKey &&
        stock == other.stock &&
        cross == other.cross &&
        brand == other.brand &&
        code == other.code &&
        name == other.name &&
        packing == other.packing &&
        price == other.price &&
        currency == other.currency &&
        amount == other.amount &&
        unit == other.unit &&
        vozvrat == other.vozvrat &&
        deliveryTime == other.deliveryTime &&
        deliveryTimeMax == other.deliveryTimeMax &&
        rejects == other.rejects &&
        dealer == other.dealer &&
        warehouseName == other.warehouseName &&
        warehouseKey == other.warehouseKey;
  }

  @override
  int get hashCode => const ListEquality().hash([
        offerKey,
        stock,
        cross,
        brand,
        code,
        name,
        packing,
        price,
        currency,
        amount,
        unit,
        vozvrat,
        deliveryTime,
        deliveryTimeMax,
        rejects,
        dealer,
        warehouseName,
        warehouseKey
      ]);
}

FullSearchResultItemStruct createFullSearchResultItemStruct({
  String? offerKey,
  int? stock,
  int? cross,
  String? brand,
  String? code,
  String? name,
  int? packing,
  String? price,
  String? currency,
  int? amount,
  String? unit,
  String? vozvrat,
  String? deliveryTime,
  String? deliveryTimeMax,
  String? rejects,
  String? dealer,
  String? warehouseName,
  String? warehouseKey,
}) =>
    FullSearchResultItemStruct(
      offerKey: offerKey,
      stock: stock,
      cross: cross,
      brand: brand,
      code: code,
      name: name,
      packing: packing,
      price: price,
      currency: currency,
      amount: amount,
      unit: unit,
      vozvrat: vozvrat,
      deliveryTime: deliveryTime,
      deliveryTimeMax: deliveryTimeMax,
      rejects: rejects,
      dealer: dealer,
      warehouseName: warehouseName,
      warehouseKey: warehouseKey,
    );
