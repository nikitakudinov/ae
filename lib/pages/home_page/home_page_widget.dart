import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
    _model.searchedArticulController =
        ExpandableController(initialExpanded: true);
    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.analogsAndCrossController =
        ExpandableController(initialExpanded: false);
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
          child: SingleChildScrollView(
            controller: _model.columnController1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE4E4E4),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () async {
                                  _model.apiResultnpb =
                                      await AeGroup.brandsCall.call(
                                    code: _model.textController.text,
                                  );
                                  if ((_model.apiResultnpb?.succeeded ??
                                      true)) {
                                    _model.data =
                                        await actions.jsonBrandCodeSearchResult(
                                      getJsonField(
                                        (_model.apiResultnpb?.jsonBody ?? ''),
                                        r'''$.DATA''',
                                        true,
                                      ),
                                    );
                                    setState(() {
                                      FFAppState().BrandCodeSearchResults =
                                          _model.data!.toList().cast<
                                              BrandCodeSearchItemStruct>();
                                      FFAppState().SEARCHHISTORYvisibility =
                                          false;
                                      FFAppState().SEARCHBRANDCODEvisibility =
                                          true;
                                    });
                                  }

                                  setState(() {});
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Артикул',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelLarge,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              setState(() {
                                _model.textController?.clear();
                              });
                              setState(() {
                                FFAppState().sr = [];
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if ((_model.textController.text == null ||
                        _model.textController.text == '') &&
                    (FFAppState().searchRequests.length != 0))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                  itemBuilder:
                                      (context, serchRequestHistoryIndex) {
                                    final serchRequestHistoryItem =
                                        serchRequestHistory[
                                            serchRequestHistoryIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.apiResultf7sa =
                                            await AeGroup.fullsearchCall.call(
                                          brand: serchRequestHistoryItem.brand,
                                          code: serchRequestHistoryItem.code,
                                          withCrosses: 1,
                                          withOffers: 1,
                                          deliveryKey:
                                              'A4GAcT7SOcnXN1kucA5bomb4Rj5SO2fV1e5bgkkDgHbY9hrszkUNTsEuZYBmJUwOEPb2iIb01uSVTJYQWkRv05qrVm4c',
                                        );
                                        if ((_model.apiResultf7sa?.succeeded ??
                                            true)) {
                                          _model.dtsr1 = await actions.dtSR(
                                            functions
                                                .newCustomFunction4(
                                                    AeGroup.fullsearchCall
                                                        .data(
                                                          (_model.apiResultf7sa
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.toList())
                                                ?.toList(),
                                          );
                                          setState(() {
                                            FFAppState().sr = _model.dtsr1!
                                                .toList()
                                                .cast<SearchResultStruct>();
                                            FFAppState().brands = functions
                                                .newCustomFunction2((AeGroup
                                                        .fullsearchCall
                                                        .dATAbrand(
                                                  (_model.apiResultf7sa
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()
                                                    ?.toList())!
                                                .toList()
                                                .cast<String>();
                                          });
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title:
                                                    Text('Запрос не отправлен'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            serchRequestHistoryItem.brand,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                          Text(
                                            serchRequestHistoryItem.code,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge,
                                          ),
                                          Text(
                                            dateTimeFormat(
                                              'relative',
                                              serchRequestHistoryItem.date!,
                                              locale: FFLocalizations.of(
                                                          context)
                                                      .languageShortCode ??
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge,
                                          ),
                                          Text(
                                            serchRequestHistoryItem.name
                                                .maybeHandleOverflow(
                                                    maxChars: 100),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          if (serchRequestHistoryIndex !=
                                              (FFAppState()
                                                      .searchRequests
                                                      .length -
                                                  1))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: Container(
                                                width: double.infinity,
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
                                  controller: _model.listViewController1,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().SEARCHBRANDCODEvisibility)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
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
                                      FFAppState().SEARCHBRANDCODEvisibility =
                                          false;
                                    });
                                    await action_blocks.loadFullSearchResults(
                                      context,
                                      brand: serchResultsItem.brand,
                                      code: serchResultsItem.code,
                                    );
                                    setState(() {});
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
                                            .maybeHandleOverflow(maxChars: 100),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      if (serchResultsIndex !=
                                          (FFAppState()
                                                  .BrandCodeSearchResults
                                                  .length -
                                              1))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
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
                              controller: _model.listViewController2,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().sr.length != 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      controller: _model.columnController2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: ExpandableNotifier(
                                  controller: _model.searchedArticulController,
                                  child: ExpandablePanel(
                                    header: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Искомый артикул',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      'Roboto Condensed',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    collapsed: Container(),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final searchebleItemHeader =
                                                  FFAppState()
                                                      .sr
                                                      .where((e) =>
                                                          e.cross == null ||
                                                          e.cross == '')
                                                      .toList()
                                                      .take(1)
                                                      .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    searchebleItemHeader.length,
                                                itemBuilder: (context,
                                                    searchebleItemHeaderIndex) {
                                                  final searchebleItemHeaderItem =
                                                      searchebleItemHeader[
                                                          searchebleItemHeaderIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '${searchebleItemHeaderItem.brand}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                          Text(
                                                            searchebleItemHeaderItem
                                                                .code,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 15.0)),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          searchebleItemHeaderItem
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                controller:
                                                    _model.brandCodeName,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final lowerPrice = FFAppState()
                                                  .sr
                                                  .where((e) =>
                                                      e.cross == null ||
                                                      e.cross == '')
                                                  .toList()
                                                  .sortedList((e) => e.price)
                                                  .toList()
                                                  .take(1)
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: lowerPrice.length,
                                                itemBuilder:
                                                    (context, lowerPriceIndex) {
                                                  final lowerPriceItem =
                                                      lowerPrice[
                                                          lowerPriceIndex];
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'МИН. ЦЕНА',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto Condensed',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              lowerPriceItem
                                                                  .rejects
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Asap Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                LinearPercentIndicator(
                                                                  percent: functions
                                                                      .doubleToPerc(
                                                                          lowerPriceItem
                                                                              .rejects)!,
                                                                  width: 50.0,
                                                                  lineHeight:
                                                                      5.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFFDC6365),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFF6067BB),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              '% ОТКАЗОВ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Asap Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        8.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              lowerPriceItem
                                                                  .price
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              () {
                                                                if (dateTimeFormat(
                                                                      'yMd',
                                                                      functions.newCustomFunction3(
                                                                          lowerPriceItem
                                                                              .deliveryTime),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) ==
                                                                    dateTimeFormat(
                                                                      'yMd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )) {
                                                                  return 'Сегодня';
                                                                } else if (dateTimeFormat(
                                                                      'yMd',
                                                                      functions.newCustomFunction3(
                                                                          lowerPriceItem
                                                                              .deliveryTime),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) ==
                                                                    dateTimeFormat(
                                                                      'yMd',
                                                                      functions
                                                                          .tomorrowdate(),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )) {
                                                                  return 'Завтра';
                                                                } else {
                                                                  return dateTimeFormat(
                                                                    'relative',
                                                                    functions.newCustomFunction3(
                                                                        lowerPriceItem
                                                                            .deliveryTime),
                                                                    locale: FFLocalizations.of(context)
                                                                            .languageShortCode ??
                                                                        FFLocalizations.of(context)
                                                                            .languageCode,
                                                                  );
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.00, 0.00),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .add_shopping_cart,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                controller: _model.minPrice,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final fastestDelivery =
                                                  FFAppState()
                                                      .sr
                                                      .where((e) =>
                                                          e.cross == null ||
                                                          e.cross == '')
                                                      .toList()
                                                      .sortedList(
                                                          (e) => e.deliveryTime)
                                                      .toList()
                                                      .take(1)
                                                      .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    fastestDelivery.length,
                                                itemBuilder: (context,
                                                    fastestDeliveryIndex) {
                                                  final fastestDeliveryItem =
                                                      fastestDelivery[
                                                          fastestDeliveryIndex];
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'МИН. СРОК',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto Condensed',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              fastestDeliveryItem
                                                                  .rejects
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Asap Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                LinearPercentIndicator(
                                                                  percent: functions
                                                                      .doubleToPerc(
                                                                          fastestDeliveryItem
                                                                              .rejects)!,
                                                                  width: 50.0,
                                                                  lineHeight:
                                                                      5.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFFDC6365),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFF6067BB),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              '% ОТКАЗОВ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Asap Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        8.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              fastestDeliveryItem
                                                                  .price
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              () {
                                                                if (dateTimeFormat(
                                                                      'yMd',
                                                                      functions.newCustomFunction3(
                                                                          fastestDeliveryItem
                                                                              .deliveryTime),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) ==
                                                                    dateTimeFormat(
                                                                      'yMd',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )) {
                                                                  return 'Сегодня';
                                                                } else if (dateTimeFormat(
                                                                      'yMd',
                                                                      functions.newCustomFunction3(
                                                                          fastestDeliveryItem
                                                                              .deliveryTime),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) ==
                                                                    dateTimeFormat(
                                                                      'yMd',
                                                                      functions
                                                                          .tomorrowdate(),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )) {
                                                                  return 'Завтра';
                                                                } else {
                                                                  return dateTimeFormat(
                                                                    'relative',
                                                                    functions.newCustomFunction3(
                                                                        fastestDeliveryItem
                                                                            .deliveryTime),
                                                                    locale: FFLocalizations.of(context)
                                                                            .languageShortCode ??
                                                                        FFLocalizations.of(context)
                                                                            .languageCode,
                                                                  );
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.00, 0.00),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .add_shopping_cart,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                controller: _model.minDate,
                                              );
                                            },
                                          ),
                                        ),
                                        if (FFAppState()
                                                .sr
                                                .where((e) =>
                                                    (e.cross == null ||
                                                        e.cross == '') &&
                                                    (e.stock == 1))
                                                .toList()
                                                .sortedList(
                                                    (e) => e.deliveryTime)
                                                .length >
                                            0)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF1F1F1),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            'В НАЛИЧИИ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto Condensed',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final cross02 = FFAppState()
                                                            .sr
                                                            .where((e) =>
                                                                (e.cross ==
                                                                        null ||
                                                                    e.cross ==
                                                                        '') &&
                                                                (e.stock == 1))
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.deliveryTime)
                                                            .toList()
                                                            .take(3)
                                                            .toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              cross02.length,
                                                          itemBuilder: (context,
                                                              cross02Index) {
                                                            final cross02Item =
                                                                cross02[
                                                                    cross02Index];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                cross02Item.warehouseName,
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '${cross02Item.price.toString()}',
                                                                                style: FlutterFlowTheme.of(context).labelLarge,
                                                                              ),
                                                                              Text(
                                                                                '${cross02Item.amount.toString()} ${cross02Item.unit}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            () {
                                                                              if (dateTimeFormat(
                                                                                    'yMd',
                                                                                    functions.newCustomFunction3(cross02Item.deliveryTime),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ) ==
                                                                                  dateTimeFormat(
                                                                                    'yMd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )) {
                                                                                return 'Сегодня';
                                                                              } else if (dateTimeFormat(
                                                                                    'yMd',
                                                                                    functions.newCustomFunction3(cross02Item.deliveryTime),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ) ==
                                                                                  dateTimeFormat(
                                                                                    'yMd',
                                                                                    functions.tomorrowdate(),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )) {
                                                                                return 'Завтра';
                                                                              } else {
                                                                                return dateTimeFormat(
                                                                                  'relative',
                                                                                  functions.newCustomFunction3(cross02Item.deliveryTime),
                                                                                  locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                );
                                                                              }
                                                                            }(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelSmall,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.00,
                                                                            0.00),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add_shopping_cart,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                          controller: _model
                                                              .listViewController3,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .sr
                                                          .where((e) =>
                                                              (e.cross ==
                                                                      null ||
                                                                  e.cross ==
                                                                      '') &&
                                                              (e.stock == 1))
                                                          .toList()
                                                          .sortedList((e) =>
                                                              e.deliveryTime)
                                                          .length >
                                                      3)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEAEAEA),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .expandableController1,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        'В наличии еще на ${FFAppState().sr.where((e) => (e.cross == null || e.cross == '') && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).length.toString()} складах',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Roboto Condensed',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(),
                                                                    expanded:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final cross03 = FFAppState()
                                                                              .sr
                                                                              .where((e) => (e.cross == null || e.cross == '') && (e.stock == 1))
                                                                              .toList()
                                                                              .sortedList((e) => e.deliveryTime)
                                                                              .toList();
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                cross03.length,
                                                                            itemBuilder:
                                                                                (context, cross03Index) {
                                                                              final cross03Item = cross03[cross03Index];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  cross03Item.warehouseName,
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  '${cross03Item.price.toString()}',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                ),
                                                                                                Text(
                                                                                                  '${cross03Item.amount.toString()} ${cross03Item.unit}',
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              () {
                                                                                                if (dateTimeFormat(
                                                                                                      'yMd',
                                                                                                      functions.newCustomFunction3(cross03Item.deliveryTime),
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ) ==
                                                                                                    dateTimeFormat(
                                                                                                      'yMd',
                                                                                                      getCurrentTimestamp,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    )) {
                                                                                                  return 'Сегодня';
                                                                                                } else if (dateTimeFormat(
                                                                                                      'yMd',
                                                                                                      functions.newCustomFunction3(cross03Item.deliveryTime),
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ) ==
                                                                                                    dateTimeFormat(
                                                                                                      'yMd',
                                                                                                      functions.tomorrowdate(),
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    )) {
                                                                                                  return 'Завтра';
                                                                                                } else {
                                                                                                  return dateTimeFormat(
                                                                                                    'relative',
                                                                                                    functions.newCustomFunction3(cross03Item.deliveryTime),
                                                                                                    locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                  );
                                                                                                }
                                                                                              }(),
                                                                                              style: FlutterFlowTheme.of(context).labelSmall,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(1.00, 0.00),
                                                                                          child: FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 20.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 40.0,
                                                                                            icon: Icon(
                                                                                              Icons.add_shopping_cart,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              print('IconButton pressed ...');
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                            controller:
                                                                                _model.listViewController4,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                color: Colors.white,
                                                child: ExpandableNotifier(
                                                  controller: _model
                                                      .expandableController2,
                                                  child: ExpandablePanel(
                                                    header: Text(
                                                      'Все предложения',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Condensed',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    ),
                                                    collapsed: Container(),
                                                    expanded: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final cross0 = FFAppState()
                                                              .sr
                                                              .where((e) =>
                                                                  e.cross ==
                                                                      null ||
                                                                  e.cross == '')
                                                              .toList()
                                                              .sortedList((e) =>
                                                                  e.deliveryTime)
                                                              .toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                cross0.length,
                                                            itemBuilder: (context,
                                                                cross0Index) {
                                                              final cross0Item =
                                                                  cross0[
                                                                      cross0Index];
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  '${cross0Item.rejects.toString()} %',
                                                                                  style: FlutterFlowTheme.of(context).labelSmall,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Opacity(
                                                                                      opacity: 0.7,
                                                                                      child: LinearPercentIndicator(
                                                                                        percent: functions.doubleToPerc(cross0Item.rejects)!,
                                                                                        width: 100.0,
                                                                                        lineHeight: 5.0,
                                                                                        animation: true,
                                                                                        animateFromLastPercent: true,
                                                                                        progressColor: Color(0xFFDC272B),
                                                                                        backgroundColor: Color(0xFF1928A5),
                                                                                        padding: EdgeInsets.zero,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                  'ВЕРОЯТНОСТЬ ОТКАЗА',
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Asap Condensed',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 8.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '${cross0Item.price.toString()}',
                                                                                style: FlutterFlowTheme.of(context).labelLarge,
                                                                              ),
                                                                              Text(
                                                                                '${cross0Item.amount.toString()}${cross0Item.unit}',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                () {
                                                                                  if (dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.newCustomFunction3(cross0Item.deliveryTime),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ) ==
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        getCurrentTimestamp,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )) {
                                                                                    return 'Сегодня';
                                                                                  } else if (dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.newCustomFunction3(cross0Item.deliveryTime),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ) ==
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.tomorrowdate(),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )) {
                                                                                    return 'Завтра';
                                                                                  } else {
                                                                                    return dateTimeFormat(
                                                                                      'relative',
                                                                                      functions.newCustomFunction3(cross0Item.deliveryTime),
                                                                                      locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                              Text(
                                                                                dateTimeFormat(
                                                                                  'Hm',
                                                                                  functions.newCustomFunction3(cross0Item.deliveryTimeMax),
                                                                                  locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.00, 0.00),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.add_shopping_cart,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x3EDCDCDC),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            controller: _model
                                                                .listViewController5,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    theme: ExpandableThemeData(
                                                      tapHeaderToExpand: true,
                                                      tapBodyToExpand: false,
                                                      tapBodyToCollapse: false,
                                                      headerAlignment:
                                                          ExpandablePanelHeaderAlignment
                                                              .center,
                                                      hasIcon: true,
                                                      expandIcon:
                                                          FontAwesomeIcons.plus,
                                                      collapseIcon:
                                                          FontAwesomeIcons
                                                              .minus,
                                                      iconSize: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 15.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller:
                                          _model.analogsAndCrossController,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Аналоги / Кроссы',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Condensed',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Builder(
                                              builder: (context) {
                                                final brandsListView =
                                                    FFAppState()
                                                        .brands
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      brandsListView.length,
                                                  itemBuilder: (context,
                                                      brandsListViewIndex) {
                                                    final brandsListViewItem =
                                                        brandsListView[
                                                            brandsListViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final header = FFAppState()
                                                                    .sr
                                                                    .where((e) =>
                                                                        '\"${e.brand}\"' ==
                                                                        brandsListViewItem)
                                                                    .toList()
                                                                    .take(1)
                                                                    .toList();
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      header
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          headerIndex) {
                                                                    final headerItem =
                                                                        header[
                                                                            headerIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await action_blocks
                                                                            .loadFullSearchResults(
                                                                          context,
                                                                          brand:
                                                                              headerItem.brand,
                                                                          code:
                                                                              headerItem.code,
                                                                        );
                                                                        setState(
                                                                            () {});
                                                                        await _model
                                                                            .columnController1
                                                                            ?.animateTo(
                                                                          0,
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                headerItem.brand,
                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  headerItem.code,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .listViewController7,
                                                                );
                                                              },
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final name = FFAppState()
                                                                    .sr
                                                                    .where((e) =>
                                                                        '\"${e.brand}\"' ==
                                                                        brandsListViewItem)
                                                                    .toList()
                                                                    .take(1)
                                                                    .toList();
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          name.length,
                                                                          (nameIndex) {
                                                                    final nameItem =
                                                                        name[
                                                                            nameIndex];
                                                                    return Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.8,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        nameItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final lowerPrice = FFAppState()
                                                                    .sr
                                                                    .where((e) =>
                                                                        '\"${e.brand}\"' ==
                                                                        brandsListViewItem)
                                                                    .toList()
                                                                    .sortedList(
                                                                        (e) => e
                                                                            .price)
                                                                    .take(5)
                                                                    .toList()
                                                                    .take(1)
                                                                    .toList();
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      lowerPrice
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          lowerPriceIndex) {
                                                                    final lowerPriceItem =
                                                                        lowerPrice[
                                                                            lowerPriceIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'МИН. ЦЕНА',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Roboto Condensed',
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                lowerPriceItem.rejects.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Asap Condensed',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  LinearPercentIndicator(
                                                                                    percent: functions.doubleToPerc(lowerPriceItem.rejects)!,
                                                                                    width: 50.0,
                                                                                    lineHeight: 5.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: Color(0xFFDC6365),
                                                                                    backgroundColor: Color(0xFF6067BB),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                '% ОТКАЗОВ',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Asap Condensed',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 8.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                lowerPriceItem.price.toString(),
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                              Text(
                                                                                '${lowerPriceItem.amount.toString()} ${lowerPriceItem.unit}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                () {
                                                                                  if (dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.newCustomFunction3(lowerPriceItem.deliveryTime),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ) ==
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        getCurrentTimestamp,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )) {
                                                                                    return 'Сегодня';
                                                                                  } else if (dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.newCustomFunction3(lowerPriceItem.deliveryTime),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ) ==
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.tomorrowdate(),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )) {
                                                                                    return 'Завтра';
                                                                                  } else {
                                                                                    return dateTimeFormat(
                                                                                      'relative',
                                                                                      functions.newCustomFunction3(lowerPriceItem.deliveryTime),
                                                                                      locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.00, 0.00),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.add_shopping_cart,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .listViewController8,
                                                                );
                                                              },
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final fastestDelivery = FFAppState()
                                                                    .sr
                                                                    .where((e) =>
                                                                        '\"${e.brand}\"' ==
                                                                        brandsListViewItem)
                                                                    .toList()
                                                                    .sortedList(
                                                                        (e) => e
                                                                            .deliveryTime)
                                                                    .take(5)
                                                                    .toList()
                                                                    .take(1)
                                                                    .toList();
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      fastestDelivery
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          fastestDeliveryIndex) {
                                                                    final fastestDeliveryItem =
                                                                        fastestDelivery[
                                                                            fastestDeliveryIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'МИН. СРОК',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Roboto Condensed',
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                fastestDeliveryItem.rejects.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Asap Condensed',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  LinearPercentIndicator(
                                                                                    percent: functions.doubleToPerc(fastestDeliveryItem.rejects)!,
                                                                                    width: 50.0,
                                                                                    lineHeight: 5.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: Color(0xFFDC6365),
                                                                                    backgroundColor: Color(0xFF6067BB),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                '% ОТКАЗОВ',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Asap Condensed',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 8.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                fastestDeliveryItem.price.toString(),
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                              Text(
                                                                                '${fastestDeliveryItem.amount.toString()} ${fastestDeliveryItem.unit}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                () {
                                                                                  if (dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.newCustomFunction3(fastestDeliveryItem.deliveryTime),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ) ==
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        getCurrentTimestamp,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )) {
                                                                                    return 'Сегодня';
                                                                                  } else if (dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.newCustomFunction3(fastestDeliveryItem.deliveryTime),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ) ==
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        functions.tomorrowdate(),
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )) {
                                                                                    return 'Завтра';
                                                                                  } else {
                                                                                    return dateTimeFormat(
                                                                                      'relative',
                                                                                      functions.newCustomFunction3(fastestDeliveryItem.deliveryTime),
                                                                                      locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.00, 0.00),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.add_shopping_cart,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .listViewController9,
                                                                );
                                                              },
                                                            ),
                                                            if (FFAppState()
                                                                    .sr
                                                                    .where((e) =>
                                                                        ('\"${e.brand}\"' ==
                                                                            brandsListViewItem) &&
                                                                        (e.stock ==
                                                                            1))
                                                                    .toList()
                                                                    .length !=
                                                                0)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFF1F1F1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(3.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                'В НАЛИЧИИ',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Roboto Condensed',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                10.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final cross02 = FFAppState().sr.where((e) => ('\"${e.brand}\"' == brandsListViewItem) && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).toList().take(3).toList();
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: cross02.length,
                                                                                  itemBuilder: (context, cross02Index) {
                                                                                    final cross02Item = cross02[cross02Index];
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 3,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        cross02Item.warehouseName,
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        '${cross02Item.price.toString()}',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '${cross02Item.amount.toString()} ${cross02Item.unit}',
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    () {
                                                                                                      if (dateTimeFormat(
                                                                                                            'yMd',
                                                                                                            functions.newCustomFunction3(cross02Item.deliveryTime),
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ) ==
                                                                                                          dateTimeFormat(
                                                                                                            'yMd',
                                                                                                            getCurrentTimestamp,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )) {
                                                                                                        return 'Сегодня';
                                                                                                      } else if (dateTimeFormat(
                                                                                                            'yMd',
                                                                                                            functions.newCustomFunction3(cross02Item.deliveryTime),
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ) ==
                                                                                                          dateTimeFormat(
                                                                                                            'yMd',
                                                                                                            functions.tomorrowdate(),
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )) {
                                                                                                        return 'Завтра';
                                                                                                      } else {
                                                                                                        return dateTimeFormat(
                                                                                                          'relative',
                                                                                                          functions.newCustomFunction3(cross02Item.deliveryTime),
                                                                                                          locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                        );
                                                                                                      }
                                                                                                    }(),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(1.00, 0.00),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 20.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 40.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.add_shopping_cart,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () {
                                                                                                    print('IconButton pressed ...');
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                  controller: _model.listViewController10,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (FFAppState()
                                                                              .sr
                                                                              .where((e) => (e.cross == null || e.cross == '') && (e.stock == 1))
                                                                              .toList()
                                                                              .sortedList((e) => e.deliveryTime)
                                                                              .length >=
                                                                          3)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEAEAEA),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(5.0),
                                                                                bottomRight: Radius.circular(5.0),
                                                                                topLeft: Radius.circular(0.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    color: Color(0x00000000),
                                                                                    child: ExpandableNotifier(
                                                                                      child: ExpandablePanel(
                                                                                        header: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                                                                                          child: Text(
                                                                                            'В наличии еще на ${FFAppState().sr.where((e) => ('\"${e.brand}\"' == brandsListViewItem) && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).length.toString()} складах',
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Roboto Condensed',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        collapsed: Container(),
                                                                                        expanded: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final cross04 = FFAppState().sr.where((e) => ('\"${e.brand}\"' == brandsListViewItem) && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).toList();
                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                primary: false,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: cross04.length,
                                                                                                itemBuilder: (context, cross04Index) {
                                                                                                  final cross04Item = cross04[cross04Index];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            flex: 3,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      cross04Item.warehouseName,
                                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      '${cross04Item.price.toString()}',
                                                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      '${cross04Item.amount.toString()} ${cross04Item.unit}',
                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  () {
                                                                                                                    if (dateTimeFormat(
                                                                                                                          'yMd',
                                                                                                                          functions.newCustomFunction3(cross04Item.deliveryTime),
                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                        ) ==
                                                                                                                        dateTimeFormat(
                                                                                                                          'yMd',
                                                                                                                          getCurrentTimestamp,
                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                        )) {
                                                                                                                      return 'Сегодня';
                                                                                                                    } else if (dateTimeFormat(
                                                                                                                          'yMd',
                                                                                                                          functions.newCustomFunction3(cross04Item.deliveryTime),
                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                        ) ==
                                                                                                                        dateTimeFormat(
                                                                                                                          'yMd',
                                                                                                                          functions.tomorrowdate(),
                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                        )) {
                                                                                                                      return 'Завтра';
                                                                                                                    } else {
                                                                                                                      return dateTimeFormat(
                                                                                                                        'relative',
                                                                                                                        functions.newCustomFunction3(cross04Item.deliveryTime),
                                                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                                      );
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                                                              child: FlutterFlowIconButton(
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderRadius: 20.0,
                                                                                                                borderWidth: 1.0,
                                                                                                                buttonSize: 40.0,
                                                                                                                icon: Icon(
                                                                                                                  Icons.add_shopping_cart,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                                onPressed: () {
                                                                                                                  print('IconButton pressed ...');
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                                controller: _model.listViewController11,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        theme: ExpandableThemeData(
                                                                                          tapHeaderToExpand: true,
                                                                                          tapBodyToExpand: false,
                                                                                          tapBodyToCollapse: false,
                                                                                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                          hasIcon: false,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  ExpandableNotifier(
                                                                child:
                                                                    ExpandablePanel(
                                                                  header:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Все предложения',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto Condensed',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  collapsed:
                                                                      Container(),
                                                                  expanded:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final cross0 =
                                                                                FFAppState().sr.where((e) => '\"${e.brand}\"' == brandsListViewItem).toList().sortedList((e) => e.deliveryTime).toList();
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: cross0.length,
                                                                              itemBuilder: (context, cross0Index) {
                                                                                final cross0Item = cross0[cross0Index];
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '${cross0Item.rejects.toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Opacity(
                                                                                                        opacity: 0.7,
                                                                                                        child: LinearPercentIndicator(
                                                                                                          percent: functions.doubleToPerc(cross0Item.rejects)!,
                                                                                                          width: 100.0,
                                                                                                          lineHeight: 5.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: Color(0xFFDC272B),
                                                                                                          backgroundColor: Color(0xFF1928A5),
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'ВЕРОЯТНОСТЬ ОТКАЗА',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Asap Condensed',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 8.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  '${cross0Item.price.toString()}',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                ),
                                                                                                Text(
                                                                                                  '${cross0Item.amount.toString()}${cross0Item.unit}',
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  () {
                                                                                                    if (dateTimeFormat(
                                                                                                          'yMd',
                                                                                                          functions.newCustomFunction3(cross0Item.deliveryTime),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ) ==
                                                                                                        dateTimeFormat(
                                                                                                          'yMd',
                                                                                                          getCurrentTimestamp,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        )) {
                                                                                                      return 'Сегодня';
                                                                                                    } else if (dateTimeFormat(
                                                                                                          'yMd',
                                                                                                          functions.newCustomFunction3(cross0Item.deliveryTime),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ) ==
                                                                                                        dateTimeFormat(
                                                                                                          'yMd',
                                                                                                          functions.tomorrowdate(),
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        )) {
                                                                                                      return 'Завтра';
                                                                                                    } else {
                                                                                                      return dateTimeFormat(
                                                                                                        'relative',
                                                                                                        functions.newCustomFunction3(cross0Item.deliveryTime),
                                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                      );
                                                                                                    }
                                                                                                  }(),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                ),
                                                                                                Text(
                                                                                                  dateTimeFormat(
                                                                                                    'Hm',
                                                                                                    functions.newCustomFunction3(cross0Item.deliveryTimeMax),
                                                                                                    locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 20.0,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 40.0,
                                                                                                icon: Icon(
                                                                                                  Icons.add_shopping_cart,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('IconButton pressed ...');
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 1.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x3EDCDCDC),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                              controller: _model.listViewController12,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        false,
                                                                    tapBodyToCollapse:
                                                                        false,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                    expandIcon:
                                                                        FontAwesomeIcons
                                                                            .plus,
                                                                    collapseIcon:
                                                                        FontAwesomeIcons
                                                                            .minus,
                                                                    iconSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                    .brands
                                                                    .length !=
                                                                brandsListViewIndex)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFCDCDCD),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  controller: _model
                                                      .listViewController6,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        expanded: Container(),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
