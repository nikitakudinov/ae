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

/// End AE Group Code

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
