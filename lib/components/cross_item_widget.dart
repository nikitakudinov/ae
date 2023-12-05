import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'cross_item_model.dart';
export 'cross_item_model.dart';

class CrossItemWidget extends StatefulWidget {
  const CrossItemWidget({Key? key}) : super(key: key);

  @override
  _CrossItemWidgetState createState() => _CrossItemWidgetState();
}

class _CrossItemWidgetState extends State<CrossItemWidget> {
  late CrossItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrossItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Builder(
          builder: (context) {
            final brandsListView = FFAppState().brands.toList();
            return ListView.builder(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: brandsListView.length,
              itemBuilder: (context, brandsListViewIndex) {
                final brandsListViewItem = brandsListView[brandsListViewIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 30.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final header = FFAppState()
                                  .sr
                                  .where((e) =>
                                      '\"${e.brand}\"' == brandsListViewItem)
                                  .toList()
                                  .take(1)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: header.length,
                                itemBuilder: (context, headerIndex) {
                                  final headerItem = header[headerIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            headerItem.brand,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          Expanded(
                                            child: Text(
                                              headerItem.code,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 20.0)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 30.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final name = FFAppState()
                                  .sr
                                  .where((e) =>
                                      '\"${e.brand}\"' == brandsListViewItem)
                                  .toList()
                                  .take(1)
                                  .toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(name.length, (nameIndex) {
                                  final nameItem = name[nameIndex];
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      nameItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final lowerPrice = FFAppState()
                                  .sr
                                  .where((e) =>
                                      '\"${e.brand}\"' == brandsListViewItem)
                                  .toList()
                                  .sortedList((e) => e.price)
                                  .take(1)
                                  .toList()
                                  .take(1)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: lowerPrice.length,
                                itemBuilder: (context, lowerPriceIndex) {
                                  final lowerPriceItem =
                                      lowerPrice[lowerPriceIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'МИН. ЦЕНА',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Condensed',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              lowerPriceItem.rejects.toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        'Asap Condensed',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                LinearPercentIndicator(
                                                  percent:
                                                      functions.doubleToPerc(
                                                          lowerPriceItem
                                                              .rejects)!,
                                                  width: 50.0,
                                                  lineHeight: 5.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      Color(0xFFDC6365),
                                                  backgroundColor:
                                                      Color(0xFF6067BB),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '% ОТКАЗОВ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        'Asap Condensed',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 8.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              lowerPriceItem.price.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                            Text(
                                              '${lowerPriceItem.amount.toString()} ${lowerPriceItem.unit}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall,
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
                                                      functions
                                                          .newCustomFunction3(
                                                              lowerPriceItem
                                                                  .deliveryTime),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ) ==
                                                    dateTimeFormat(
                                                      'yMd',
                                                      getCurrentTimestamp,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )) {
                                                  return 'Сегодня';
                                                } else if (dateTimeFormat(
                                                      'yMd',
                                                      functions
                                                          .newCustomFunction3(
                                                              lowerPriceItem
                                                                  .deliveryTime),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ) ==
                                                    dateTimeFormat(
                                                      'yMd',
                                                      functions.tomorrowdate(),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )) {
                                                  return 'Завтра';
                                                } else {
                                                  return dateTimeFormat(
                                                    'relative',
                                                    functions
                                                        .newCustomFunction3(
                                                            lowerPriceItem
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
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.00, 0.00),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.add_shopping_cart,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final fastestDelivery = FFAppState()
                                  .sr
                                  .where((e) =>
                                      '\"${e.brand}\"' == brandsListViewItem)
                                  .toList()
                                  .sortedList((e) => e.deliveryTime)
                                  .take(1)
                                  .toList()
                                  .take(1)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: fastestDelivery.length,
                                itemBuilder: (context, fastestDeliveryIndex) {
                                  final fastestDeliveryItem =
                                      fastestDelivery[fastestDeliveryIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'МИН. СРОК',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Condensed',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              fastestDeliveryItem.rejects
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        'Asap Condensed',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                LinearPercentIndicator(
                                                  percent:
                                                      functions.doubleToPerc(
                                                          fastestDeliveryItem
                                                              .rejects)!,
                                                  width: 50.0,
                                                  lineHeight: 5.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      Color(0xFFDC6365),
                                                  backgroundColor:
                                                      Color(0xFF6067BB),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '% ОТКАЗОВ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        'Asap Condensed',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 8.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              fastestDeliveryItem.price
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                            Text(
                                              '${fastestDeliveryItem.amount.toString()} ${fastestDeliveryItem.unit}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall,
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
                                                      functions
                                                          .newCustomFunction3(
                                                              fastestDeliveryItem
                                                                  .deliveryTime),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ) ==
                                                    dateTimeFormat(
                                                      'yMd',
                                                      getCurrentTimestamp,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )) {
                                                  return 'Сегодня';
                                                } else if (dateTimeFormat(
                                                      'yMd',
                                                      functions
                                                          .newCustomFunction3(
                                                              fastestDeliveryItem
                                                                  .deliveryTime),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ) ==
                                                    dateTimeFormat(
                                                      'yMd',
                                                      functions.tomorrowdate(),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )) {
                                                  return 'Завтра';
                                                } else {
                                                  return dateTimeFormat(
                                                    'relative',
                                                    functions
                                                        .newCustomFunction3(
                                                            fastestDeliveryItem
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
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.00, 0.00),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.add_shopping_cart,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                              );
                            },
                          ),
                        ),
                        if (FFAppState()
                                .sr
                                .where((e) =>
                                    ('\"${e.brand}\"' == brandsListViewItem) &&
                                    (e.stock == 1))
                                .toList()
                                .length !=
                            0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Container(
                              height: (FFAppState()
                                              .sr
                                              .where((e) =>
                                                  ('\"${e.brand}\"' ==
                                                      brandsListViewItem) &&
                                                  (e.stock == 1))
                                              .toList()
                                              .length *
                                          50 +
                                      50)
                                  .toDouble(),
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 10.0, 0.0),
                                          child: Text(
                                            'В НАЛИЧИИ',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      'Roboto Condensed',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 10.0),
                                        child: Builder(
                                          builder: (context) {
                                            final cross02 = FFAppState()
                                                .sr
                                                .where((e) =>
                                                    ('\"${e.brand}\"' ==
                                                        brandsListViewItem) &&
                                                    (e.stock == 1))
                                                .toList()
                                                .sortedList(
                                                    (e) => e.deliveryTime)
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: cross02.length,
                                              itemBuilder:
                                                  (context, cross02Index) {
                                                final cross02Item =
                                                    cross02[cross02Index];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
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
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    cross02Item
                                                                        .warehouseName,
                                                                    style: FlutterFlowTheme.of(
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    '${cross02Item.price.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge,
                                                                  ),
                                                                  Text(
                                                                    '${cross02Item.amount.toString()} ${cross02Item.unit}',
                                                                    style: FlutterFlowTheme.of(
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
                                                                        functions
                                                                            .newCustomFunction3(cross02Item.deliveryTime),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) ==
                                                                      dateTimeFormat(
                                                                        'yMd',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )) {
                                                                    return 'Сегодня';
                                                                  } else if (dateTimeFormat(
                                                                        'yMd',
                                                                        functions
                                                                            .newCustomFunction3(cross02Item.deliveryTime),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) ==
                                                                      dateTimeFormat(
                                                                        'yMd',
                                                                        functions
                                                                            .tomorrowdate(),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )) {
                                                                    return 'Завтра';
                                                                  } else {
                                                                    return dateTimeFormat(
                                                                      'relative',
                                                                      functions.newCustomFunction3(
                                                                          cross02Item
                                                                              .deliveryTime),
                                                                      locale: FFLocalizations.of(context)
                                                                              .languageShortCode ??
                                                                          FFLocalizations.of(context)
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
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.00, 0.00),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .add_shopping_cart,
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
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: ExpandableNotifier(
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Все предложения',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Roboto Condensed',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final cross0 = FFAppState()
                                            .sr
                                            .where((e) =>
                                                ('\"${e.brand}\"' ==
                                                    brandsListViewItem) &&
                                                (e.stock != 1))
                                            .toList()
                                            .sortedList((e) => e.deliveryTime)
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: cross0.length,
                                          itemBuilder: (context, cross0Index) {
                                            final cross0Item =
                                                cross0[cross0Index];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '${cross0Item.rejects.toString()} %',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Opacity(
                                                                    opacity:
                                                                        0.7,
                                                                    child:
                                                                        LinearPercentIndicator(
                                                                      percent: functions
                                                                          .doubleToPerc(
                                                                              cross0Item.rejects)!,
                                                                      width:
                                                                          100.0,
                                                                      lineHeight:
                                                                          5.0,
                                                                      animation:
                                                                          true,
                                                                      animateFromLastPercent:
                                                                          true,
                                                                      progressColor:
                                                                          Color(
                                                                              0xFFDC272B),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xFF1928A5),
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                'ВЕРОЯТНОСТЬ ОТКАЗА',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${cross0Item.price.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
                                                            ),
                                                            Text(
                                                              '${cross0Item.amount.toString()}${cross0Item.unit}',
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
                                                                          cross0Item
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
                                                                          cross0Item
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
                                                                        cross0Item
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
                                                            Text(
                                                              dateTimeFormat(
                                                                'Hm',
                                                                functions.newCustomFunction3(
                                                                    cross0Item
                                                                        .deliveryTimeMax),
                                                                locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageShortCode ??
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                              ),
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
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                                expandIcon: FontAwesomeIcons.plus,
                                collapseIcon: FontAwesomeIcons.minus,
                                iconSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                        if (FFAppState().brands.length != brandsListViewIndex)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 3.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFCDCDCD),
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
    );
  }
}
