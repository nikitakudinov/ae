import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'full_search_results_model.dart';
export 'full_search_results_model.dart';

class FullSearchResultsWidget extends StatefulWidget {
  const FullSearchResultsWidget({
    Key? key,
    this.brand,
    this.code,
  }) : super(key: key);

  final String? brand;
  final String? code;

  @override
  _FullSearchResultsWidgetState createState() =>
      _FullSearchResultsWidgetState();
}

class _FullSearchResultsWidgetState extends State<FullSearchResultsWidget> {
  late FullSearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullSearchResultsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultf7s = await SupabaseGroup.srCall.call();
      if ((_model.apiResultf7s?.succeeded ?? true)) {
        _model.dtsr = await actions.dtSR(
          functions
              .newCustomFunction4((_model.apiResultf7s?.jsonBody ?? ''))
              ?.toList(),
        );
        setState(() {
          FFAppState().sr = _model.dtsr!.toList().cast<SearchResultStruct>();
          FFAppState().brands = functions
              .newCustomFunction2(SupabaseGroup.srCall
                  .brand(
                    (_model.apiResultf7s?.jsonBody ?? ''),
                  )
                  ?.toList())!
              .toList()
              .cast<String>();
        });
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
    });

    _model.expandableController1 = ExpandableController(initialExpanded: true);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 25.0,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    'https://supabase.proplayclub.ru/storage/v1/object/public/playground/autoeuro-logo-s.png',
                    height: 25.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ExpandableNotifier(
                        controller: _model.expandableController1,
                        child: ExpandablePanel(
                          header: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Искомый артикул',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Roboto Condensed',
                                        color: FlutterFlowTheme.of(context)
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final searchebleItemHeader = FFAppState()
                                        .sr
                                        .where((e) =>
                                            e.cross == null || e.cross == '')
                                        .toList()
                                        .take(1)
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchebleItemHeader.length,
                                      itemBuilder:
                                          (context, searchebleItemHeaderIndex) {
                                        final searchebleItemHeaderItem =
                                            searchebleItemHeader[
                                                searchebleItemHeaderIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '${searchebleItemHeaderItem.brand}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                                Text(
                                                  searchebleItemHeaderItem.code,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                searchebleItemHeaderItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final cross01 = FFAppState()
                                        .sr
                                        .where((e) =>
                                            e.cross == null || e.cross == '')
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
                                      itemCount: cross01.length,
                                      itemBuilder: (context, cross01Index) {
                                        final cross01Item =
                                            cross01[cross01Index];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Мин. цена',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              cross01Item.price.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                'relative',
                                                functions.newCustomFunction3(
                                                    cross01Item.deliveryTime),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final cross01 = FFAppState()
                                        .sr
                                        .where((e) =>
                                            e.cross == null || e.cross == '')
                                        .toList()
                                        .sortedList((e) => e.deliveryTime)
                                        .toList()
                                        .take(1)
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: cross01.length,
                                      itemBuilder: (context, cross01Index) {
                                        final cross01Item =
                                            cross01[cross01Index];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Мин. срок',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              cross01Item.price.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                'relative',
                                                functions.newCustomFunction3(
                                                    cross01Item.deliveryTime),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final cross01 = FFAppState()
                                        .sr
                                        .where((e) =>
                                            (e.cross == null ||
                                                e.cross == '') &&
                                            (e.stock == 1))
                                        .toList()
                                        .sortedList((e) => e.deliveryTime)
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: cross01.length,
                                      itemBuilder: (context, cross01Index) {
                                        final cross01Item =
                                            cross01[cross01Index];
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'В наличии',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Asap Condensed',
                                                                  color: Color(
                                                                      0xFF06A502),
                                                                ),
                                                      ),
                                                      Text(
                                                        cross01Item
                                                            .warehouseName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '${cross01Item.price.toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                      ),
                                                      Text(
                                                        '${cross01Item.amount.toString()} ${cross01Item.unit}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    () {
                                                      if (dateTimeFormat(
                                                            'yMd',
                                                            functions
                                                                .newCustomFunction3(
                                                                    cross01Item
                                                                        .deliveryTime),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'yMd',
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )) {
                                                        return 'Сегодня';
                                                      } else if (dateTimeFormat(
                                                            'yMd',
                                                            functions
                                                                .newCustomFunction3(
                                                                    cross01Item
                                                                        .deliveryTime),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'yMd',
                                                            functions
                                                                .tomorrowdate(),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )) {
                                                        return 'Завтра';
                                                      } else {
                                                        return dateTimeFormat(
                                                          'relative',
                                                          functions
                                                              .newCustomFunction3(
                                                                  cross01Item
                                                                      .deliveryTime),
                                                          locale: FFLocalizations
                                                                      .of(
                                                                          context)
                                                                  .languageShortCode ??
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      }
                                                    }(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: ExpandableNotifier(
                                        controller:
                                            _model.expandableController2,
                                        child: ExpandablePanel(
                                          header: Text(
                                            'Все предложения',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily:
                                                      'Roboto Condensed',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final cross0 = FFAppState()
                                                    .sr
                                                    .where((e) =>
                                                        e.cross == null ||
                                                        e.cross == '')
                                                    .toList()
                                                    .sortedList(
                                                        (e) => e.deliveryTime)
                                                    .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: cross0.length,
                                                  itemBuilder:
                                                      (context, cross0Index) {
                                                    final cross0Item =
                                                        cross0[cross0Index];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
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
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '${cross0Item.rejects.toString()} %',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall,
                                                                      ),
                                                                      Opacity(
                                                                        opacity:
                                                                            0.7,
                                                                        child:
                                                                            LinearPercentIndicator(
                                                                          percent:
                                                                              functions.doubleToPerc(cross0Item.rejects)!,
                                                                          width:
                                                                              100.0,
                                                                          lineHeight:
                                                                              5.0,
                                                                          animation:
                                                                              true,
                                                                          animateFromLastPercent:
                                                                              true,
                                                                          progressColor:
                                                                              Color(0xFFDC272B),
                                                                          backgroundColor:
                                                                              Color(0xFF1928A5),
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'ВЕРОЯТНОСТЬ ОТКАЗА',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
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
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '${cross0Item.price.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
                                                                    ),
                                                                    Text(
                                                                      '${cross0Item.amount.toString()}${cross0Item.unit}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
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
                                                                            locale:
                                                                                FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                          );
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'Hm',
                                                                        functions
                                                                            .newCustomFunction3(cross0Item.deliveryTimeMax),
                                                                        locale: FFLocalizations.of(context).languageShortCode ??
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .add_shopping_cart,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x3E40464A),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
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
                                            expandIcon: FontAwesomeIcons.plus,
                                            collapseIcon:
                                                FontAwesomeIcons.minus,
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
                            controller: _model.expandableController3,
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Аналоги / Кроссы',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Roboto Condensed',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              collapsed: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final brandsListView =
                                          FFAppState().brands.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: brandsListView.length,
                                        itemBuilder:
                                            (context, brandsListViewIndex) {
                                          final brandsListViewItem =
                                              brandsListView[
                                                  brandsListViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final header = FFAppState()
                                                          .sr
                                                          .where((e) =>
                                                              '\"${e.brand}\"' ==
                                                              brandsListViewItem)
                                                          .toList()
                                                          .take(1)
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            header.length,
                                                        itemBuilder: (context,
                                                            headerIndex) {
                                                          final headerItem =
                                                              header[
                                                                  headerIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    headerItem
                                                                        .brand,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium,
                                                                  ),
                                                                  Text(
                                                                    headerItem
                                                                        .code,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        20.0)),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
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
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            name.length,
                                                            (nameIndex) {
                                                          final nameItem =
                                                              name[nameIndex];
                                                          return Text(
                                                            nameItem.name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final fastestDelivery =
                                                          FFAppState()
                                                              .sr
                                                              .where((e) =>
                                                                  '\"${e.brand}\"' ==
                                                                  brandsListViewItem)
                                                              .toList()
                                                              .sortedList((e) =>
                                                                  e.deliveryTime)
                                                              .take(5)
                                                              .toList()
                                                              .take(1)
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            fastestDelivery
                                                                .length,
                                                        itemBuilder: (context,
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
                                                                flex: 3,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'МИН. ЦЕНА',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto Condensed',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      fastestDeliveryItem
                                                                          .price
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
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
                                                                            locale:
                                                                                FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                          );
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .add_shopping_cart,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final lowerPrice = FFAppState()
                                                          .sr
                                                          .where((e) =>
                                                              '\"${e.brand}\"' ==
                                                              brandsListViewItem)
                                                          .toList()
                                                          .sortedList(
                                                              (e) => e.price)
                                                          .take(5)
                                                          .toList()
                                                          .take(1)
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            lowerPrice.length,
                                                        itemBuilder: (context,
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
                                                                flex: 3,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'МИН. СРОК',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto Condensed',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CircularPercentIndicator(
                                                                      percent: functions
                                                                          .doubleToPerc(
                                                                              lowerPriceItem.rejects)!,
                                                                      radius:
                                                                          12.5,
                                                                      lineWidth:
                                                                          3.0,
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
                                                                      center:
                                                                          Text(
                                                                        '${lowerPriceItem.rejects.toString()}%',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Roboto Condensed',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 9.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      lowerPriceItem
                                                                          .price
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'relative',
                                                                        functions
                                                                            .newCustomFunction3(lowerPriceItem.deliveryTime),
                                                                        locale: FFLocalizations.of(context).languageShortCode ??
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .add_shopping_cart,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final cross02 = FFAppState()
                                                            .sr
                                                            .where((e) =>
                                                                ('\"${e.brand}\"' ==
                                                                    brandsListViewItem) &&
                                                                (e.stock == 1))
                                                            .toList()
                                                            .sortedList((e) =>
                                                                e.deliveryTime)
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
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'В наличии',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Asap Condensed',
                                                                                  color: Color(0xFF06A502),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            cross02Item.warehouseName,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            '${cross02Item.price.toString()}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelLarge,
                                                                          ),
                                                                          Text(
                                                                            '${cross02Item.amount.toString()} ${cross02Item.unit}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelSmall,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
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
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.00,
                                                                            0.00),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add_shopping_cart,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
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
                                                  ExpandableNotifier(
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Builder(
                                                        builder: (context) {
                                                          final resultsRow =
                                                              FFAppState()
                                                                  .sr
                                                                  .where((e) =>
                                                                      '\"${e.brand}\"' ==
                                                                      brandsListViewItem)
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
                                                                resultsRow
                                                                    .length,
                                                            itemBuilder: (context,
                                                                resultsRowIndex) {
                                                              final resultsRowItem =
                                                                  resultsRow[
                                                                      resultsRowIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
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
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          resultsRowItem.deliveryTime == resultsRowItem.deliveryTimeMax
                                                                              ? dateTimeFormat(
                                                                                  'd MMM',
                                                                                  functions.newCustomFunction3(resultsRowItem.deliveryTime),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )
                                                                              : '${dateTimeFormat(
                                                                                  'd',
                                                                                  functions.newCustomFunction3(resultsRowItem.deliveryTime),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )}-${dateTimeFormat(
                                                                                  'dMMM',
                                                                                  functions.newCustomFunction3(resultsRowItem.deliveryTimeMax),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )}',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            'Hm',
                                                                            functions.newCustomFunction3(resultsRowItem.deliveryTimeMax),
                                                                            locale:
                                                                                FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            '${resultsRowItem.amount.toString()}${resultsRowItem.unit}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          '${resultsRowItem.price.toString()}',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                        expandIcon:
                                                            FontAwesomeIcons
                                                                .plus,
                                                        collapseIcon:
                                                            FontAwesomeIcons
                                                                .minus,
                                                        iconSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
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
                                    ExpandablePanelHeaderAlignment.center,
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
      ),
    );
  }
}
