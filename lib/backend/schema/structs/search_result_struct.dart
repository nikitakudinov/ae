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
    String? currency,
    int? stock,
    int? amount,
    String? unit,
    String? orderBefore,
    String? deliveryTime,
    String? deliveryTimeMax,
    double? rejects,
    int? dealer,
    String? warehouseName,
    String? warehouseKey,
    int? ttl,
    double? price,
    String? packing,
  })  : _offerKey = offerKey,
        _cross = cross,
        _brand = brand,
        _code = code,
        _name = name,
        _currency = currency,
        _stock = stock,
        _amount = amount,
        _unit = unit,
        _orderBefore = orderBefore,
        _deliveryTime = deliveryTime,
        _deliveryTimeMax = deliveryTimeMax,
        _rejects = rejects,
        _dealer = dealer,
        _warehouseName = warehouseName,
        _warehouseKey = warehouseKey,
        _ttl = ttl,
        _price = price,
        _packing = packing;

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

  // "rejects" field.
  double? _rejects;
  double get rejects => _rejects ?? 0.0;
  set rejects(double? val) => _rejects = val;
  void incrementRejects(double amount) => _rejects = rejects + amount;
  bool hasRejects() => _rejects != null;

  // "dealer" field.
  int? _dealer;
  int get dealer => _dealer ?? 0;
  set dealer(int? val) => _dealer = val;
  void incrementDealer(int amount) => _dealer = dealer + amount;
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

  // "ttl" field.
  int? _ttl;
  int get ttl => _ttl ?? 0;
  set ttl(int? val) => _ttl = val;
  void incrementTtl(int amount) => _ttl = ttl + amount;
  bool hasTtl() => _ttl != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "packing" field.
  String? _packing;
  String get packing => _packing ?? '';
  set packing(String? val) => _packing = val;
  bool hasPacking() => _packing != null;

  static SearchResultStruct fromMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        offerKey: data['offer_key'] as String?,
        cross: data['cross'] as String?,
        brand: data['brand'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        currency: data['currency'] as String?,
        stock: castToType<int>(data['stock']),
        amount: castToType<int>(data['amount']),
        unit: data['unit'] as String?,
        orderBefore: data['order_before'] as String?,
        deliveryTime: data['delivery_time'] as String?,
        deliveryTimeMax: data['delivery_time_max'] as String?,
        rejects: castToType<double>(data['rejects']),
        dealer: castToType<int>(data['dealer']),
        warehouseName: data['warehouse_name'] as String?,
        warehouseKey: data['warehouse_key'] as String?,
        ttl: castToType<int>(data['ttl']),
        price: castToType<double>(data['price']),
        packing: data['packing'] as String?,
      );

  static SearchResultStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SearchResultStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'offer_key': _offerKey,
        'cross': _cross,
        'brand': _brand,
        'code': _code,
        'name': _name,
        'currency': _currency,
        'stock': _stock,
        'amount': _amount,
        'unit': _unit,
        'order_before': _orderBefore,
        'delivery_time': _deliveryTime,
        'delivery_time_max': _deliveryTimeMax,
        'rejects': _rejects,
        'dealer': _dealer,
        'warehouse_name': _warehouseName,
        'warehouse_key': _warehouseKey,
        'ttl': _ttl,
        'price': _price,
        'packing': _packing,
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
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'stock': serializeParam(
          _stock,
          ParamType.int,
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
        'rejects': serializeParam(
          _rejects,
          ParamType.double,
        ),
        'dealer': serializeParam(
          _dealer,
          ParamType.int,
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
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'packing': serializeParam(
          _packing,
          ParamType.String,
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
        rejects: deserializeParam(
          data['rejects'],
          ParamType.double,
          false,
        ),
        dealer: deserializeParam(
          data['dealer'],
          ParamType.int,
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
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        packing: deserializeParam(
          data['packing'],
          ParamType.String,
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
        currency == other.currency &&
        stock == other.stock &&
        amount == other.amount &&
        unit == other.unit &&
        orderBefore == other.orderBefore &&
        deliveryTime == other.deliveryTime &&
        deliveryTimeMax == other.deliveryTimeMax &&
        rejects == other.rejects &&
        dealer == other.dealer &&
        warehouseName == other.warehouseName &&
        warehouseKey == other.warehouseKey &&
        ttl == other.ttl &&
        price == other.price &&
        packing == other.packing;
  }

  @override
  int get hashCode => const ListEquality().hash([
        offerKey,
        cross,
        brand,
        code,
        name,
        currency,
        stock,
        amount,
        unit,
        orderBefore,
        deliveryTime,
        deliveryTimeMax,
        rejects,
        dealer,
        warehouseName,
        warehouseKey,
        ttl,
        price,
        packing
      ]);
}

SearchResultStruct createSearchResultStruct({
  String? offerKey,
  String? cross,
  String? brand,
  String? code,
  String? name,
  String? currency,
  int? stock,
  int? amount,
  String? unit,
  String? orderBefore,
  String? deliveryTime,
  String? deliveryTimeMax,
  double? rejects,
  int? dealer,
  String? warehouseName,
  String? warehouseKey,
  int? ttl,
  double? price,
  String? packing,
}) =>
    SearchResultStruct(
      offerKey: offerKey,
      cross: cross,
      brand: brand,
      code: code,
      name: name,
      currency: currency,
      stock: stock,
      amount: amount,
      unit: unit,
      orderBefore: orderBefore,
      deliveryTime: deliveryTime,
      deliveryTimeMax: deliveryTimeMax,
      rejects: rejects,
      dealer: dealer,
      warehouseName: warehouseName,
      warehouseKey: warehouseKey,
      ttl: ttl,
      price: price,
      packing: packing,
    );
