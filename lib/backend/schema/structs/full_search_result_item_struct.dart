// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullSearchResultItemStruct extends BaseStruct {
  FullSearchResultItemStruct({
    String? offerKey,
    String? cross,
    String? brand,
    String? code,
    String? name,
    int? packing,
    String? price,
    String? currency,
    int? amount,
    String? unit,
    String? orderBefore,
    String? deliveryTime,
    String? deliveryTimeMax,
    String? warehouseName,
    String? warehouseKey,
    int? ttl,
    String? stock,
    String? rejects,
    String? rt,
    String? dealer,
  })  : _offerKey = offerKey,
        _cross = cross,
        _brand = brand,
        _code = code,
        _name = name,
        _packing = packing,
        _price = price,
        _currency = currency,
        _amount = amount,
        _unit = unit,
        _orderBefore = orderBefore,
        _deliveryTime = deliveryTime,
        _deliveryTimeMax = deliveryTimeMax,
        _warehouseName = warehouseName,
        _warehouseKey = warehouseKey,
        _ttl = ttl,
        _stock = stock,
        _rejects = rejects,
        _rt = rt,
        _dealer = dealer;

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

  // "order_before" field.
  String? _orderBefore;
  String get orderBefore => _orderBefore ?? '';
  set orderBefore(String? val) => _orderBefore = val;
  bool hasOrderBefore() => _orderBefore != null;

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

  // "ttl" field.
  int? _ttl;
  int get ttl => _ttl ?? 0;
  set ttl(int? val) => _ttl = val;
  void incrementTtl(int amount) => _ttl = ttl + amount;
  bool hasTtl() => _ttl != null;

  // "stock" field.
  String? _stock;
  String get stock => _stock ?? '';
  set stock(String? val) => _stock = val;
  bool hasStock() => _stock != null;

  // "rejects" field.
  String? _rejects;
  String get rejects => _rejects ?? '';
  set rejects(String? val) => _rejects = val;
  bool hasRejects() => _rejects != null;

  // "rt" field.
  String? _rt;
  String get rt => _rt ?? '';
  set rt(String? val) => _rt = val;
  bool hasRt() => _rt != null;

  // "dealer" field.
  String? _dealer;
  String get dealer => _dealer ?? '';
  set dealer(String? val) => _dealer = val;
  bool hasDealer() => _dealer != null;

  static FullSearchResultItemStruct fromMap(Map<String, dynamic> data) =>
      FullSearchResultItemStruct(
        offerKey: data['offer_key'] as String?,
        cross: data['cross'] as String?,
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        packing: castToType<int>(data['packing']),
        price: data['price'] as String?,
        currency: data['currency'] as String?,
        amount: castToType<int>(data['amount']),
        unit: data['unit'] as String?,
        orderBefore: data['order_before'] as String?,
        deliveryTime: data['delivery_time'] as String?,
        deliveryTimeMax: data['delivery_time_max'] as String?,
        warehouseName: data['warehouse_name'] as String?,
        warehouseKey: data['warehouse_key'] as String?,
        ttl: castToType<int>(data['ttl']),
        stock: data['stock'] as String?,
        rejects: data['rejects'] as String?,
        rt: data['rt'] as String?,
        dealer: data['dealer'] as String?,
      );

  static FullSearchResultItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? FullSearchResultItemStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'offer_key': _offerKey,
        'cross': _cross,
        'brand': _brand,
        'code': _code,
        'name': _name,
        'packing': _packing,
        'price': _price,
        'currency': _currency,
        'amount': _amount,
        'unit': _unit,
        'order_before': _orderBefore,
        'delivery_time': _deliveryTime,
        'delivery_time_max': _deliveryTimeMax,
        'warehouse_name': _warehouseName,
        'warehouse_key': _warehouseKey,
        'ttl': _ttl,
        'stock': _stock,
        'rejects': _rejects,
        'rt': _rt,
        'dealer': _dealer,
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
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'order_before': serializeParam(
          _orderBefore,
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
        'warehouse_name': serializeParam(
          _warehouseName,
          ParamType.String,
        ),
        'warehouse_key': serializeParam(
          _warehouseKey,
          ParamType.String,
        ),
        'ttl': serializeParam(
          _ttl,
          ParamType.int,
        ),
        'stock': serializeParam(
          _stock,
          ParamType.String,
        ),
        'rejects': serializeParam(
          _rejects,
          ParamType.String,
        ),
        'rt': serializeParam(
          _rt,
          ParamType.String,
        ),
        'dealer': serializeParam(
          _dealer,
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
        orderBefore: deserializeParam(
          data['order_before'],
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
        ttl: deserializeParam(
          data['ttl'],
          ParamType.int,
          false,
        ),
        stock: deserializeParam(
          data['stock'],
          ParamType.String,
          false,
        ),
        rejects: deserializeParam(
          data['rejects'],
          ParamType.String,
          false,
        ),
        rt: deserializeParam(
          data['rt'],
          ParamType.String,
          false,
        ),
        dealer: deserializeParam(
          data['dealer'],
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
        cross == other.cross &&
        brand == other.brand &&
        code == other.code &&
        name == other.name &&
        packing == other.packing &&
        price == other.price &&
        currency == other.currency &&
        amount == other.amount &&
        unit == other.unit &&
        orderBefore == other.orderBefore &&
        deliveryTime == other.deliveryTime &&
        deliveryTimeMax == other.deliveryTimeMax &&
        warehouseName == other.warehouseName &&
        warehouseKey == other.warehouseKey &&
        ttl == other.ttl &&
        stock == other.stock &&
        rejects == other.rejects &&
        rt == other.rt &&
        dealer == other.dealer;
  }

  @override
  int get hashCode => const ListEquality().hash([
        offerKey,
        cross,
        brand,
        code,
        name,
        packing,
        price,
        currency,
        amount,
        unit,
        orderBefore,
        deliveryTime,
        deliveryTimeMax,
        warehouseName,
        warehouseKey,
        ttl,
        stock,
        rejects,
        rt,
        dealer
      ]);
}

FullSearchResultItemStruct createFullSearchResultItemStruct({
  String? offerKey,
  String? cross,
  String? brand,
  String? code,
  String? name,
  int? packing,
  String? price,
  String? currency,
  int? amount,
  String? unit,
  String? orderBefore,
  String? deliveryTime,
  String? deliveryTimeMax,
  String? warehouseName,
  String? warehouseKey,
  int? ttl,
  String? stock,
  String? rejects,
  String? rt,
  String? dealer,
}) =>
    FullSearchResultItemStruct(
      offerKey: offerKey,
      cross: cross,
      brand: brand,
      code: code,
      name: name,
      packing: packing,
      price: price,
      currency: currency,
      amount: amount,
      unit: unit,
      orderBefore: orderBefore,
      deliveryTime: deliveryTime,
      deliveryTimeMax: deliveryTimeMax,
      warehouseName: warehouseName,
      warehouseKey: warehouseKey,
      ttl: ttl,
      stock: stock,
      rejects: rejects,
      rt: rt,
      dealer: dealer,
    );
