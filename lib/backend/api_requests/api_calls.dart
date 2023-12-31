import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start AE Group Code

class AeGroup {
  static String baseUrl = 'https://api.autoeuro.ru/api/v2/json/';
  static Map<String, String> headers = {
    'key': 'iUwAiDUU26hCVM8UikAopv9SLvP1Tw4YV3EUhyHZnsUK3E79RqYQKJPBT9tS',
  };
  static BrandsCall brandsCall = BrandsCall();
  static FullsearchCall fullsearchCall = FullsearchCall();
}

class BrandsCall {
  Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BRANDS',
      apiUrl: '${AeGroup.baseUrl}search_brands/?code=${code}&',
      callType: ApiCallType.GET,
      headers: {
        'key': 'iUwAiDUU26hCVM8UikAopv9SLvP1Tw4YV3EUhyHZnsUK3E79RqYQKJPBT9tS',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FullsearchCall {
  Future<ApiCallResponse> call({
    String? brand = '',
    String? code = '',
    String? deliveryKey =
        '6lWDbz3dlG8NtMZNlB1cJtNZrsdPeLA6myCbgkkDgHbY9hrszkUNTsEuZYBmJUwOEPb2iIb01uSVTJYQWkRv05qrVm4c',
    int? withCrosses = 1,
    int? withOffers = 1,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'FULLSEARCH',
      apiUrl:
          '${AeGroup.baseUrl}search_items/?select=(brand)&brand=${brand}&code=${code}&delivery_key=${deliveryKey}&with_crosses=${withCrosses}&with_offers=${withOffers}',
      callType: ApiCallType.GET,
      headers: {
        'key': 'iUwAiDUU26hCVM8UikAopv9SLvP1Tw4YV3EUhyHZnsUK3E79RqYQKJPBT9tS',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.DATA''',
        true,
      );
  dynamic dATAbrand(dynamic response) => getJsonField(
        response,
        r'''$.DATA[:].brand''',
        true,
      );
  dynamic dATAcode(dynamic response) => getJsonField(
        response,
        r'''$.DATA[:].code''',
        true,
      );
}

/// End AE Group Code

/// Start SUPABASE Group Code

class SupabaseGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static SrCall srCall = SrCall();
}

class SrCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'SR',
      apiUrl:
          '${SupabaseGroup.baseUrl}ae_search_results?select=offer_key,stock,cross,brand,code,name,packing,price,currency,amount,unit,return,order_before,delivery_time,delivery_time_max,rejects,dealer,warehouse_name,warehouse_key,ttl',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic brand(dynamic response) => getJsonField(
        response,
        r'''$[:].brand''',
        true,
      );
  dynamic code(dynamic response) => getJsonField(
        response,
        r'''$[:].code''',
        true,
      );
}

/// End SUPABASE Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
