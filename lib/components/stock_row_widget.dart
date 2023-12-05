import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stock_row_model.dart';
export 'stock_row_model.dart';

class StockRowWidget extends StatefulWidget {
  const StockRowWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final String? parameter1;

  @override
  _StockRowWidgetState createState() => _StockRowWidgetState();
}

class _StockRowWidgetState extends State<StockRowWidget> {
  late StockRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: FFAppState()
              .sr
              .where((e) =>
                  ('\"${e.brand}\"' == widget.parameter1) && (e.stock == 1))
              .toList()
              .length !=
          0,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
        child: Container(
          height: (FFAppState()
                          .sr
                          .where((e) =>
                              ('\"${e.brand}\"' == widget.parameter1) &&
                              (e.stock == 1))
                          .toList()
                          .length *
                      40 +
                  50)
              .toDouble(),
          decoration: BoxDecoration(
            color: Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
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
                Container(
                  height: (FFAppState()
                              .sr
                              .where((e) =>
                                  ('\"${e.brand}\"' == widget.parameter1) &&
                                  (e.stock == 1))
                              .toList()
                              .length *
                          40)
                      .toDouble(),
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final cross02 = FFAppState()
                          .sr
                          .where((e) =>
                              ('\"${e.brand}\"' == widget.parameter1) &&
                              (e.stock == 1))
                          .toList()
                          .sortedList((e) => e.deliveryTime)
                          .toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: cross02.length,
                        itemBuilder: (context, cross02Index) {
                          final cross02Item = cross02[cross02Index];
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cross02Item.warehouseName,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '${cross02Item.price.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                    Text(
                                      '${cross02Item.amount.toString()} ${cross02Item.unit}',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
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
                                              functions.newCustomFunction3(
                                                  cross02Item.deliveryTime),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) ==
                                            dateTimeFormat(
                                              'yMd',
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )) {
                                          return 'Сегодня';
                                        } else if (dateTimeFormat(
                                              'yMd',
                                              functions.newCustomFunction3(
                                                  cross02Item.deliveryTime),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) ==
                                            dateTimeFormat(
                                              'yMd',
                                              functions.tomorrowdate(),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )) {
                                          return 'Завтра';
                                        } else {
                                          return dateTimeFormat(
                                            'relative',
                                            functions.newCustomFunction3(
                                                cross02Item.deliveryTime),
                                            locale: FFLocalizations.of(context)
                                                    .languageShortCode ??
                                                FFLocalizations.of(context)
                                                    .languageCode,
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
                                  alignment: AlignmentDirectional(1.00, 0.00),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.add_shopping_cart,
                                      color: FlutterFlowTheme.of(context)
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
