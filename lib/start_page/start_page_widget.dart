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
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({Key? key}) : super(key: key);

  @override
  _StartPageWidgetState createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultf7s1 = await SupabaseGroup.srCall.call();
      if ((_model.apiResultf7s1?.succeeded ?? true)) {
        _model.dtsr = await actions.dtSR(
          functions
              .newCustomFunction4((_model.apiResultf7s1?.jsonBody ?? ''))
              ?.toList(),
        );
        setState(() {
          FFAppState().sr = _model.dtsr!.toList().cast<SearchResultStruct>();
          FFAppState().codes = functions
              .newCustomFunction2((SupabaseGroup.srCall.code(
                (_model.apiResultf7s1?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  ?.map((e) => e.toString())
                  .toList()
                  ?.toList())!
              .toList()
              .cast<String>();
          FFAppState().brands = functions
              .newCustomFunction2((SupabaseGroup.srCall.brand(
                (_model.apiResultf7s1?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
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
    _model.expandableController4 = ExpandableController(initialExpanded: false);
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.dehaze,
              color: Color(0xFFDC272B),
              size: 24.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Container(
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
                if (FFAppConstants.VISIBLE)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ExpandableNotifier(
                        controller: _model.expandableController1,
                        child: ExpandablePanel(
                          header: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Искомый артикул',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Roboto Condensed',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                          collapsed: Container(),
                          expanded: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState()
                                      .sr
                                      .where((e) =>
                                          e.cross == null || e.cross == '')
                                      .toList()
                                      .length ==
                                  0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: Color(0x84FF5963),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        'Нет предложений по вашему запросу, но есть варианты среди ${FFAppState().sr.where((e) => e.cross == '0').toList().length.toString()} аналогов.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Roboto Condensed',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              Builder(
                                builder: (context) {
                                  final requiredarticle = FFAppState()
                                      .sr
                                      .where((e) =>
                                          e.cross == null || e.cross == '')
                                      .toList()
                                      .take(1)
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: requiredarticle.length,
                                    itemBuilder:
                                        (context, requiredarticleIndex) {
                                      final requiredarticleItem =
                                          requiredarticle[requiredarticleIndex];
                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                requiredarticleItem.brand,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Condensed',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                requiredarticleItem.code,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.85,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  requiredarticleItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
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
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final codeitems = FFAppState()
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
                                        itemCount: codeitems.length,
                                        itemBuilder: (context, codeitemsIndex) {
                                          final codeitemsItem =
                                              codeitems[codeitemsIndex];
                                          return Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        codeitemsItem.rejects
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          LinearPercentIndicator(
                                                            percent: functions
                                                                .doubleToPerc(
                                                                    codeitemsItem
                                                                        .rejects)!,
                                                            width: 50.0,
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                Color(
                                                                    0xFFDC6365),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF6067BB),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '% ОТКАЗОВ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Asap Condensed',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        codeitemsItem.price
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      Text(
                                                        '${codeitemsItem.amount.toString()} ${codeitemsItem.unit}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        () {
                                                          if (dateTimeFormat(
                                                                'yMd',
                                                                functions.newCustomFunction3(
                                                                    codeitemsItem
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
                                                                    codeitemsItem
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
                                                                  codeitemsItem
                                                                      .deliveryTime),
                                                              locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageShortCode ??
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                            );
                                                          }
                                                        }(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final codeItems = FFAppState()
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
                                        itemCount: codeItems.length,
                                        itemBuilder: (context, codeItemsIndex) {
                                          final codeItemsItem =
                                              codeItems[codeItemsIndex];
                                          return Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        codeItemsItem.rejects
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          LinearPercentIndicator(
                                                            percent: functions
                                                                .doubleToPerc(
                                                                    codeItemsItem
                                                                        .rejects)!,
                                                            width: 50.0,
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                Color(
                                                                    0xFFDC6365),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF6067BB),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '% ОТКАЗОВ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Asap Condensed',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        codeItemsItem.price
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      Text(
                                                        '${codeItemsItem.amount.toString()} ${codeItemsItem.unit}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        () {
                                                          if (dateTimeFormat(
                                                                'yMd',
                                                                functions.newCustomFunction3(
                                                                    codeItemsItem
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
                                                                    codeItemsItem
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
                                                                  codeItemsItem
                                                                      .deliveryTime),
                                                              locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageShortCode ??
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                            );
                                                          }
                                                        }(),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                            1.00, 0.00),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.add_shopping_cart,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE4E4E4),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Наличие',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium,
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final stockitems = FFAppState()
                                                .sr
                                                .where((e) =>
                                                    (e.cross == null ||
                                                        e.cross == '') &&
                                                    (e.stock == 1))
                                                .toList()
                                                .sortedList(
                                                    (e) => e.deliveryTime)
                                                .toList()
                                                .take(3)
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: stockitems.length,
                                              itemBuilder:
                                                  (context, stockitemsIndex) {
                                                final stockitemsItem =
                                                    stockitems[stockitemsIndex];
                                                return Container(
                                                  height: 35.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: Text(
                                                                  stockitemsItem
                                                                      .warehouseName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              stockitemsItem
                                                                  .price
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium,
                                                            ),
                                                            Text(
                                                              '${stockitemsItem.amount.toString()} ${stockitemsItem.unit}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              () {
                                                                if (dateTimeFormat(
                                                                      'yMd',
                                                                      functions.newCustomFunction3(
                                                                          stockitemsItem
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
                                                                          stockitemsItem
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
                                                                        stockitemsItem
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
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 30.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .add_shopping_cart_outlined,
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
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: double.infinity,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController2,
                                              child: ExpandablePanel(
                                                header: Text(
                                                  'Еще на (${FFAppState().sr.where((e) => (e.cross == null || e.cross == '') && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).length.toString()}) складах',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                                collapsed: Container(),
                                                expanded: Builder(
                                                  builder: (context) {
                                                    final stockitem =
                                                        FFAppState()
                                                            .sr
                                                            .where((e) =>
                                                                (e.cross ==
                                                                        null ||
                                                                    e.cross ==
                                                                        '') &&
                                                                (e.stock == 1))
                                                            .toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          stockitem.length,
                                                      itemBuilder: (context,
                                                          stockitemIndex) {
                                                        final stockitemItem =
                                                            stockitem[
                                                                stockitemIndex];
                                                        return Visibility(
                                                          visible:
                                                              stockitemIndex >
                                                                  2,
                                                          child: Container(
                                                            height: 35.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.00,
                                                                              0.00),
                                                                          child:
                                                                              Text(
                                                                            stockitemItem.warehouseName,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelMedium,
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
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        stockitemItem
                                                                            .price
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                      Text(
                                                                        '${stockitemItem.amount.toString()} ${stockitemItem.unit}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        () {
                                                                          if (dateTimeFormat(
                                                                                'yMd',
                                                                                functions.newCustomFunction3(stockitemItem.deliveryTime),
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
                                                                                functions.newCustomFunction3(stockitemItem.deliveryTime),
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
                                                                              functions.newCustomFunction3(stockitemItem.deliveryTime),
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            30.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .add_shopping_cart_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                    ],
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
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
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
                              ),
                              if (FFAppState().sr.length != 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: ExpandableNotifier(
                                        controller:
                                            _model.expandableController3,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Все предложения (${FFAppState().sr.where((e) => e.cross == null || e.cross == '').toList().length.toString()})',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall,
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final allstockitems =
                                                      FFAppState()
                                                          .sr
                                                          .where(
                                                              (e) =>
                                                                  (e.cross ==
                                                                          null ||
                                                                      e.cross ==
                                                                          '') &&
                                                                  (e.stock ==
                                                                      0))
                                                          .toList()
                                                          .sortedList((e) =>
                                                              e.deliveryTime)
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        allstockitems.length,
                                                    itemBuilder: (context,
                                                        allstockitemsIndex) {
                                                      final allstockitemsItem =
                                                          allstockitems[
                                                              allstockitemsIndex];
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
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          '${allstockitemsItem.rejects.toString()} %',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).labelSmall,
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Opacity(
                                                                              opacity: 0.7,
                                                                              child: LinearPercentIndicator(
                                                                                percent: functions.doubleToPerc(allstockitemsItem.rejects)!,
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
                                                                        '${allstockitemsItem.price.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge,
                                                                      ),
                                                                      Text(
                                                                        '${allstockitemsItem.amount.toString()}${allstockitemsItem.unit}',
                                                                        style: FlutterFlowTheme.of(context)
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
                                                                                functions.newCustomFunction3(allstockitemsItem.deliveryTime),
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
                                                                                functions.newCustomFunction3(allstockitemsItem.deliveryTime),
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
                                                                              functions.newCustomFunction3(allstockitemsItem.deliveryTime),
                                                                              locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                            );
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall,
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'Hm',
                                                                          functions
                                                                              .newCustomFunction3(allstockitemsItem.deliveryTimeMax),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        ),
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
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            30.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .add_shopping_cart,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (allstockitemsIndex !=
                                                              (FFAppState()
                                                                      .sr
                                                                      .where((e) =>
                                                                          e.cross ==
                                                                              null ||
                                                                          e.cross ==
                                                                              '')
                                                                      .toList()
                                                                      .length -
                                                                  1))
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
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
                                                  );
                                                },
                                              ),
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
                                            iconPadding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 23.0, 0.0),
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
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFDADADA),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableController4,
                      child: ExpandablePanel(
                        header: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Аналоги / Кроссы',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Roboto Condensed',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Visibility(
                          visible: FFAppConstants.VISIBLE,
                          child: Builder(
                            builder: (context) {
                              final brands = FFAppState()
                                  .brands
                                  .where((e) =>
                                      e !=
                                      '\"${FFAppState().sr.where((e) => e.cross == null || e.cross == '').toList().first.brand}\"')
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: brands.length,
                                itemBuilder: (context, brandsIndex) {
                                  final brandsItem = brands[brandsIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .quotesRemover(brandsItem),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Condensed',
                                                        color:
                                                            Color(0xFF454D61),
                                                      ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final codes =
                                                  FFAppState().codes.toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: codes.length,
                                                itemBuilder:
                                                    (context, codesIndex) {
                                                  final codesItem =
                                                      codes[codesIndex];
                                                  return Visibility(
                                                    visible: FFAppState()
                                                            .sr
                                                            .where((e) =>
                                                                ('\"${e.brand}\"' ==
                                                                    brandsItem) &&
                                                                ('\"${e.code}\"' ==
                                                                    codesItem))
                                                            .toList()
                                                            .length !=
                                                        0,
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final cODEitemTITLE = FFAppState()
                                                                          .sr
                                                                          .where((e) =>
                                                                              ('\"${e.code}\"' == codesItem) &&
                                                                              ('\"${e.brand}\"' ==
                                                                                  brandsItem))
                                                                          .toList()
                                                                          .take(
                                                                              1)
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
                                                                            cODEitemTITLE.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                cODEitemTITLEIndex) {
                                                                          final cODEitemTITLEItem =
                                                                              cODEitemTITLE[cODEitemTITLEIndex];
                                                                          return Visibility(
                                                                            visible:
                                                                                cODEitemTITLEIndex == 0,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFE4E4E4),
                                                                                    borderRadius: BorderRadius.circular(3.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                    child: Text(
                                                                                      cODEitemTITLEItem.code,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    cODEitemTITLEItem.name,
                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final codeItems = FFAppState()
                                                                      .sr
                                                                      .where((e) =>
                                                                          ('\"${e.code}\"' ==
                                                                              codesItem) &&
                                                                          ('\"${e.brand}\"' ==
                                                                              brandsItem))
                                                                      .toList()
                                                                      .sortedList(
                                                                          (e) =>
                                                                              e.price)
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
                                                                        codeItems
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            codeItemsIndex) {
                                                                      final codeItemsItem =
                                                                          codeItems[
                                                                              codeItemsIndex];
                                                                      return Container(
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        'МИН. ЦЕНА',
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Roboto Condensed',
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 2,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    codeItemsItem.rejects.toString(),
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
                                                                                        percent: functions.doubleToPerc(codeItemsItem.rejects)!,
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
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    codeItemsItem.price.toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium,
                                                                                  ),
                                                                                  Text(
                                                                                    '${codeItemsItem.amount.toString()} ${codeItemsItem.unit}',
                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Text(
                                                                                    () {
                                                                                      if (dateTimeFormat(
                                                                                            'yMd',
                                                                                            functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                                            functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                                          functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
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
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final codeItems = FFAppState()
                                                                      .sr
                                                                      .where((e) =>
                                                                          ('\"${e.code}\"' ==
                                                                              codesItem) &&
                                                                          ('\"${e.brand}\"' ==
                                                                              brandsItem))
                                                                      .toList()
                                                                      .sortedList(
                                                                          (e) =>
                                                                              e.deliveryTime)
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
                                                                        codeItems
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            codeItemsIndex) {
                                                                      final codeItemsItem =
                                                                          codeItems[
                                                                              codeItemsIndex];
                                                                      return Container(
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        'МИН. СРОК',
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Roboto Condensed',
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 2,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    codeItemsItem.rejects.toString(),
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
                                                                                        percent: functions.doubleToPerc(codeItemsItem.rejects)!,
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
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    codeItemsItem.price.toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium,
                                                                                  ),
                                                                                  Text(
                                                                                    '${codeItemsItem.amount.toString()} ${codeItemsItem.unit}',
                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Text(
                                                                                    () {
                                                                                      if (dateTimeFormat(
                                                                                            'yMd',
                                                                                            functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                                            functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                                          functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .sr
                                                                  .where((e) =>
                                                                      ('\"${e.code}\"' == codesItem) &&
                                                                      ('\"${e.brand}\"' ==
                                                                          brandsItem) &&
                                                                      (e.stock ==
                                                                          1))
                                                                  .toList()
                                                                  .sortedList(
                                                                      (e) => e
                                                                          .deliveryTime)
                                                                  .length !=
                                                              0)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFE4E4E4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Наличие',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final stockItems = FFAppState()
                                                                              .sr
                                                                              .where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock == 1))
                                                                              .toList()
                                                                              .sortedList((e) => e.deliveryTime)
                                                                              .toList()
                                                                              .take(3)
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
                                                                                stockItems.length,
                                                                            itemBuilder:
                                                                                (context, stockItemsIndex) {
                                                                              final stockItemsItem = stockItems[stockItemsIndex];
                                                                              return Container(
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 3,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                              child: Text(
                                                                                                stockItemsItem.warehouseName,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Roboto Condensed',
                                                                                                      fontSize: 12.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            stockItemsItem.price.toString(),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium,
                                                                                          ),
                                                                                          Text(
                                                                                            '${stockItemsItem.amount.toString()} ${stockItemsItem.unit}',
                                                                                            style: FlutterFlowTheme.of(context).labelSmall,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            () {
                                                                                              if (dateTimeFormat(
                                                                                                    'yMd',
                                                                                                    functions.newCustomFunction3(stockItemsItem.deliveryTime),
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
                                                                                                    functions.newCustomFunction3(stockItemsItem.deliveryTime),
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
                                                                                                  functions.newCustomFunction3(stockItemsItem.deliveryTime),
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
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 20.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 30.0,
                                                                                            icon: Icon(
                                                                                              Icons.add_shopping_cart_outlined,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              print('IconButton pressed ...');
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                      if (FFAppState()
                                                                              .sr
                                                                              .where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock == 1))
                                                                              .toList()
                                                                              .sortedList((e) => e.deliveryTime)
                                                                              .length !=
                                                                          0)
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            color:
                                                                                Color(0x00000000),
                                                                            child:
                                                                                ExpandableNotifier(
                                                                              child: ExpandablePanel(
                                                                                header: Text(
                                                                                  'Еще на (${FFAppState().sr.where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).length.toString()}) складах',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                                collapsed: Container(),
                                                                                expanded: Builder(
                                                                                  builder: (context) {
                                                                                    final stockItemsfull = FFAppState().sr.where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).toList();
                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: stockItemsfull.length,
                                                                                      itemBuilder: (context, stockItemsfullIndex) {
                                                                                        final stockItemsfullItem = stockItemsfull[stockItemsfullIndex];
                                                                                        return Visibility(
                                                                                          visible: stockItemsfullIndex > 2,
                                                                                          child: Container(
                                                                                            height: 35.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 3,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                          child: Text(
                                                                                                            stockItemsfullItem.warehouseName,
                                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                  fontFamily: 'Roboto Condensed',
                                                                                                                  fontSize: 12.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        stockItemsfullItem.price.toString(),
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '${stockItemsfullItem.amount.toString()} ${stockItemsfullItem.unit}',
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        () {
                                                                                                          if (dateTimeFormat(
                                                                                                                'yMd',
                                                                                                                functions.newCustomFunction3(stockItemsfullItem.deliveryTime),
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
                                                                                                                functions.newCustomFunction3(stockItemsfullItem.deliveryTime),
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
                                                                                                              functions.newCustomFunction3(stockItemsfullItem.deliveryTime),
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
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        borderWidth: 1.0,
                                                                                                        buttonSize: 30.0,
                                                                                                        icon: Icon(
                                                                                                          Icons.add_shopping_cart_outlined,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                        onPressed: () {
                                                                                                          print('IconButton pressed ...');
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
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
                                                            ),
                                                          if (FFAppState()
                                                                  .sr
                                                                  .where((e) =>
                                                                      ('\"${e.code}\"' == codesItem) &&
                                                                      ('\"${e.brand}\"' ==
                                                                          brandsItem) &&
                                                                      (e.stock !=
                                                                          1))
                                                                  .toList()
                                                                  .sortedList(
                                                                      (e) => e
                                                                          .deliveryTime)
                                                                  .length !=
                                                              0)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  color: Colors
                                                                      .white,
                                                                  child:
                                                                      ExpandableNotifier(
                                                                    child:
                                                                        ExpandablePanel(
                                                                      header:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Все предложения (${FFAppState().sr.where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock != 1)).toList().sortedList((e) => e.deliveryTime).length.toString()})',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleSmall,
                                                                        ),
                                                                      ),
                                                                      collapsed:
                                                                          Container(),
                                                                      expanded:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              10.0,
                                                                              10.0,
                                                                              10.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final codeItems = FFAppState().sr.where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock != 1)).toList().sortedList((e) => e.deliveryTime).toList();
                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: codeItems.length,
                                                                                itemBuilder: (context, codeItemsIndex) {
                                                                                  final codeItemsItem = codeItems[codeItemsIndex];
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
                                                                                                      '${codeItemsItem.rejects.toString()} %',
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Opacity(
                                                                                                          opacity: 0.7,
                                                                                                          child: LinearPercentIndicator(
                                                                                                            percent: functions.doubleToPerc(codeItemsItem.rejects)!,
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
                                                                                                    '${codeItemsItem.price.toString()}',
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    '${codeItemsItem.amount.toString()}${codeItemsItem.unit}',
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
                                                                                                            functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                                                            functions.newCustomFunction3(codeItemsItem.deliveryTime),
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
                                                                                                          functions.newCustomFunction3(codeItemsItem.deliveryTime),
                                                                                                          locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                        );
                                                                                                      }
                                                                                                    }(),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    dateTimeFormat(
                                                                                                      'Hm',
                                                                                                      functions.newCustomFunction3(codeItemsItem.deliveryTimeMax),
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
                                                                                      if (codeItemsIndex != (FFAppState().sr.where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock != 1)).toList().length - 1))
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
                                                                              );
                                                                            },
                                                                          ),
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
                                                                            ExpandablePanelHeaderAlignment.center,
                                                                        hasIcon:
                                                                            true,
                                                                        expandIcon:
                                                                            FontAwesomeIcons.plus,
                                                                        collapseIcon:
                                                                            FontAwesomeIcons.minus,
                                                                        iconSize:
                                                                            15.0,
                                                                        iconPadding: EdgeInsets.fromLTRB(
                                                                            0.0,
                                                                            0.0,
                                                                            23.0,
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (codesItem !=
                                                              codesItem)
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final codeItems = FFAppState()
                                                                      .sr
                                                                      .where((e) =>
                                                                          ('\"${e.code}\"' ==
                                                                              codesItem) &&
                                                                          ('\"${e.brand}\"' ==
                                                                              brandsItem))
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
                                                                        codeItems
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            codeItemsIndex) {
                                                                      final codeItemsItem =
                                                                          codeItems[
                                                                              codeItemsIndex];
                                                                      return Text(
                                                                        'БАЗОВЫЙ ЗАПРОС${codeItemsItem.code} ${codeItemsItem.brand}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      );
                                                                    },
                                                                  );
                                                                },
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
                                          if (brandsIndex !=
                                              (FFAppState().brands.length - 1))
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
                                                  color: Color(0xFFD3D3D3),
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
        ),
      ),
    );
  }
}
