import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'm_i_ncost_model.dart';
export 'm_i_ncost_model.dart';

class MINcostWidget extends StatefulWidget {
  const MINcostWidget({
    Key? key,
    this.brand,
    required this.code,
    required this.stock,
  }) : super(key: key);

  final String? brand;
  final String? code;
  final int? stock;

  @override
  _MINcostWidgetState createState() => _MINcostWidgetState();
}

class _MINcostWidgetState extends State<MINcostWidget> {
  late MINcostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MINcostModel());
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
      height: 45.0,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final mINcostItem = FFAppState()
              .sr
              .where(
                  (e) => (e.brand == widget.brand) && (e.code == widget.code))
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
            itemCount: mINcostItem.length,
            itemBuilder: (context, mINcostItemIndex) {
              final mINcostItemItem = mINcostItem[mINcostItemIndex];
              return Container(
                height: 35.0,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            mINcostItemItem.rejects.toString(),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Asap Condensed',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LinearPercentIndicator(
                                percent: functions
                                    .doubleToPerc(mINcostItemItem.rejects)!,
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
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Asap Condensed',
                                      color: FlutterFlowTheme.of(context)
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            mINcostItemItem.price.toString(),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                          Text(
                            '${mINcostItemItem.amount.toString()} ${mINcostItemItem.unit}',
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
                                    functions.newCustomFunction3(
                                        mINcostItemItem.deliveryTime),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'yMd',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) {
                                return 'Сегодня';
                              } else if (dateTimeFormat(
                                    'yMd',
                                    functions.newCustomFunction3(
                                        mINcostItemItem.deliveryTime),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'yMd',
                                    functions.tomorrowdate(),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) {
                                return 'Завтра';
                              } else {
                                return dateTimeFormat(
                                  'relative',
                                  functions.newCustomFunction3(
                                      mINcostItemItem.deliveryTime),
                                  locale: FFLocalizations.of(context)
                                          .languageShortCode ??
                                      FFLocalizations.of(context).languageCode,
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
    );
  }
}
