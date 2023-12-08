import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future loadFullSearchResults(
  BuildContext context, {
  String? brand,
  String? code,
}) async {
  ApiCallResponse? jsonFULLSEARCH;
  List<SearchResultStruct>? dtFULLSEARCH;

  jsonFULLSEARCH = await AeGroup.fullsearchCall.call(
    brand: brand,
    code: code,
    withCrosses: 1,
    withOffers: 1,
    deliveryKey:
        'A4GAcT7SOcnXN1kucA5bomb4Rj5SO2fV1e5bgkkDgHbY9hrszkUNTsEuZYBmJUwOEPb2iIb01uSVTJYQWkRv05qrVm4c',
  );
  if ((jsonFULLSEARCH?.succeeded ?? true) == true) {
    dtFULLSEARCH = await actions.dtSR(
      functions
          .newCustomFunction4(AeGroup.fullsearchCall
              .data(
                (jsonFULLSEARCH?.jsonBody ?? ''),
              )
              ?.toList())
          ?.toList(),
    );
    FFAppState().update(() {
      FFAppState().sr = dtFULLSEARCH!.toList().cast<SearchResultStruct>();
      FFAppState().brands = functions
          .newCustomFunction2((AeGroup.fullsearchCall.dATAbrand(
            (jsonFULLSEARCH?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              ?.toList())!
          .toList()
          .cast<String>();
      FFAppState().codes = functions
          .newCustomFunction2((AeGroup.fullsearchCall.dATAcode(
            (jsonFULLSEARCH?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              ?.map((e) => e.toString())
              .toList()
              ?.toList())!
          .toList()
          .cast<String>();
    });
    if (FFAppState().sr.length == 0) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('По вашему запросу ничего не найдено.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Запрос не отправлен'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
