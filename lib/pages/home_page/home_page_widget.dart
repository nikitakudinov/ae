import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().BrandCodeSearchResults = [];
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        setState(() {
          FFAppState().SEARCHHISTORYvisibility = true;
        });
      },
    );
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          title: Text(
            'AUTOEURO',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE4E4E4),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
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
                            _model.data =
                                await actions.jsonBrandCodeSearchResult(
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
                              FFAppState().SEARCHHISTORYvisibility = false;
                            });
                          }

                          setState(() {});
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Артикул',
                        labelStyle: FlutterFlowTheme.of(context).labelLarge,
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
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((_model.textController.text == null ||
                              _model.textController.text == '') ||
                          (FFAppState().searchRequests.length == 0))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'НЕДАВНИЕ ЗАПРОСЫ',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Roboto Condensed',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final serchRequestHistory = FFAppState()
                                          .searchRequests
                                          .sortedList((e) => e.date!)
                                          .toList()
                                          .take(5)
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: serchRequestHistory.length,
                                        itemBuilder: (context,
                                            serchRequestHistoryIndex) {
                                          final serchRequestHistoryItem =
                                              serchRequestHistory[
                                                  serchRequestHistoryIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    serchRequestHistoryItem
                                                        .brand,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        serchRequestHistoryItem
                                                            .code,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'relative',
                                                          serchRequestHistoryItem
                                                              .date!,
                                                          locale: FFLocalizations
                                                                      .of(
                                                                          context)
                                                                  .languageShortCode ??
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 50.0)),
                                                  ),
                                                  Text(
                                                    serchRequestHistoryItem.name
                                                        .maybeHandleOverflow(
                                                            maxChars: 100),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall,
                                                  ),
                                                  if (serchRequestHistoryIndex !=
                                                      (FFAppState()
                                                              .searchRequests
                                                              .length -
                                                          1))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.88,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFDCDCDC),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Builder(
                              builder: (context) {
                                final serchResults = FFAppState()
                                    .BrandCodeSearchResults
                                    .toList();
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
                                        setState(() {
                                          FFAppState().addToSearchRequests(
                                              SearchRequestStruct(
                                            brand: serchResultsItem.brand,
                                            code: serchResultsItem.code,
                                            name: serchResultsItem.name,
                                            date: getCurrentTimestamp,
                                          ));
                                          FFAppState().SEARCHHISTORYvisibility =
                                              false;
                                        });

                                        context.pushNamed(
                                          'fullSearchResults',
                                          queryParameters: {
                                            'brand': serializeParam(
                                              serchResultsItem.brand,
                                              ParamType.String,
                                            ),
                                            'code': serializeParam(
                                              serchResultsItem.code,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            serchResultsItem.brand,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                          Text(
                                            serchResultsItem.code,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge,
                                          ),
                                          Text(
                                            serchResultsItem.name
                                                .maybeHandleOverflow(
                                                    maxChars: 100),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          if (serchResultsIndex !=
                                              (FFAppState()
                                                      .BrandCodeSearchResults
                                                      .length -
                                                  1))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 1.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFDCDCDC),
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
                      ),
                    ],
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
