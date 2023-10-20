import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () async {
                        _model.apiResultnpb = await AeGroup.brandsCall.call(
                          code: _model.textController.text,
                        );
                        if ((_model.apiResultnpb?.succeeded ?? true)) {
                          _model.data = await actions.jsonBrandCodeSearchResult(
                            getJsonField(
                              (_model.apiResultnpb?.jsonBody ?? ''),
                              r'''$.DATA''',
                              true,
                            ),
                          );
                          setState(() {
                            FFAppState().BrandCodeSearchResults = _model.data!
                                .toList()
                                .cast<BrandCodeSearchItemStruct>();
                          });
                        }

                        setState(() {});
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Артикул',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Builder(
                        builder: (context) {
                          final serchResults =
                              FFAppState().BrandCodeSearchResults.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: serchResults.length,
                            itemBuilder: (context, serchResultsIndex) {
                              final serchResultsItem =
                                  serchResults[serchResultsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.apiResult6921 =
                                      await AeGroup.fullsearchCall.call(
                                    brand: serchResultsItem.brand,
                                    code: serchResultsItem.code,
                                    deliveryKey:
                                        'A4GAcT7SOcnXN1kucA5bomb4Rj5SO2fV1e5bgkkDgHbY9hrszkUNTsEuZYBmJUwOEPb2iIb01uSVTJYQWkRv05qrVm4c',
                                    withCrosses: 1,
                                  );
                                  if ((_model.apiResult6921?.succeeded ??
                                      true)) {
                                    _model.dRFullSearch =
                                        await actions.jsonFullSearchResult(
                                      functions
                                          .newCustomFunction(getJsonField(
                                            (_model.apiResult6921?.jsonBody ??
                                                ''),
                                            r'''$.DATA''',
                                            true,
                                          ))
                                          ?.toList(),
                                    );
                                    setState(() {
                                      FFAppState().FullSearchResultItems =
                                          _model.dRFullSearch!.toList().cast<
                                              FullSearchResultItemStruct>();
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'work',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serchResultsItem.brand,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    Text(
                                      serchResultsItem.code,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      serchResultsItem.name
                                          .maybeHandleOverflow(maxChars: 100),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Container(
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFAEAEAE),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFAEAEAE),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Builder(
                        builder: (context) {
                          final fullSerchResults =
                              FFAppState().FullSearchResultItems.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: fullSerchResults.length,
                            itemBuilder: (context, fullSerchResultsIndex) {
                              final fullSerchResultsItem =
                                  fullSerchResults[fullSerchResultsIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fullSerchResultsItem.brand,
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                  Text(
                                    fullSerchResultsItem.code,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    fullSerchResultsItem.name
                                        .maybeHandleOverflow(maxChars: 100),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFAEAEAE),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
