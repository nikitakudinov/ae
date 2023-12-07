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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Builder(
                    builder: (context) {
                      final brands = FFAppState().brands.toList();
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    functions.quotesRemover(brandsItem),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge,
                                ),
                                Builder(
                                  builder: (context) {
                                    final codes = FFAppState().codes.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: codes.length,
                                      itemBuilder: (context, codesIndex) {
                                        final codesItem = codes[codesIndex];
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
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final cODEitemTITLE = FFAppState()
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
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  cODEitemTITLE
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  cODEitemTITLEIndex) {
                                                                final cODEitemTITLEItem =
                                                                    cODEitemTITLE[
                                                                        cODEitemTITLEIndex];
                                                                return Visibility(
                                                                  visible:
                                                                      cODEitemTITLEIndex ==
                                                                          0,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        cODEitemTITLEItem
                                                                            .code,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                      ),
                                                                      Text(
                                                                        cODEitemTITLEItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge,
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
                                                if (FFAppState()
                                                        .sr
                                                        .where((e) =>
                                                            ('\"${e.code}\"' ==
                                                                codesItem) &&
                                                            ('\"${e.brand}\"' ==
                                                                brandsItem) &&
                                                            (e.stock == 1))
                                                        .toList()
                                                        .sortedList((e) =>
                                                            e.deliveryTime)
                                                        .length !=
                                                    0)
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE4E4E4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Наличие',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final stockItems = FFAppState()
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
                                                                  .toList()
                                                                  .take(3)
                                                                  .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    stockItems
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        stockItemsIndex) {
                                                                  final stockItemsItem =
                                                                      stockItems[
                                                                          stockItemsIndex];
                                                                  return Text(
                                                                    stockItemsItem
                                                                        .warehouseName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  );
                                                                },
                                                              );
                                                            },
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
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Text(
                                                                      'Еще на (${FFAppState().sr.where((e) => ('\"${e.code}\"' == codesItem) && ('\"${e.brand}\"' == brandsItem) && (e.stock == 1)).toList().sortedList((e) => e.deliveryTime).length.toString()}) складах',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                    collapsed:
                                                                        Container(),
                                                                    expanded:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final stockItemsfull = FFAppState()
                                                                            .sr
                                                                            .where((e) =>
                                                                                ('\"${e.code}\"' == codesItem) &&
                                                                                ('\"${e.brand}\"' == brandsItem) &&
                                                                                (e.stock == 1))
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
                                                                              stockItemsfull.length,
                                                                          itemBuilder:
                                                                              (context, stockItemsfullIndex) {
                                                                            final stockItemsfullItem =
                                                                                stockItemsfull[stockItemsfullIndex];
                                                                            return Visibility(
                                                                              visible: stockItemsfullIndex > 3,
                                                                              child: Text(
                                                                                stockItemsfullItem.warehouseName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
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
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final codeItems = FFAppState()
                                                          .sr
                                                          .where((e) =>
                                                              ('\"${e.code}\"' ==
                                                                  codesItem) &&
                                                              ('\"${e.brand}\"' ==
                                                                  brandsItem))
                                                          .toList()
                                                          .sortedList(
                                                              (e) => e.price)
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
                                                            codeItems.length,
                                                        itemBuilder: (context,
                                                            codeItemsIndex) {
                                                          final codeItemsItem =
                                                              codeItems[
                                                                  codeItemsIndex];
                                                          return Container(
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
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'МИН. ЦЕНА',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Roboto Condensed',
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        codeItemsItem
                                                                            .rejects
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Asap Condensed',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 10.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          LinearPercentIndicator(
                                                                            percent:
                                                                                functions.doubleToPerc(codeItemsItem.rejects)!,
                                                                            width:
                                                                                50.0,
                                                                            lineHeight:
                                                                                5.0,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                Color(0xFFDC6365),
                                                                            backgroundColor:
                                                                                Color(0xFF6067BB),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        '% ОТКАЗОВ',
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
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        codeItemsItem
                                                                            .price
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                      Text(
                                                                        '${codeItemsItem.amount.toString()} ${codeItemsItem.unit}',
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
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final codeItems = FFAppState()
                                                          .sr
                                                          .where((e) =>
                                                              ('\"${e.code}\"' ==
                                                                  codesItem) &&
                                                              ('\"${e.brand}\"' ==
                                                                  brandsItem))
                                                          .toList()
                                                          .take(5)
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            codeItems.length,
                                                        itemBuilder: (context,
                                                            codeItemsIndex) {
                                                          final codeItemsItem =
                                                              codeItems[
                                                                  codeItemsIndex];
                                                          return Text(
                                                            'БАЗОВЫЙ ЗАПРОС${codeItemsItem.code} ${codeItemsItem.brand}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                              ],
                            ),
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
      ),
    );
  }
}
