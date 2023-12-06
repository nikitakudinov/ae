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
import 'mindelivery_model.dart';
export 'mindelivery_model.dart';

class MindeliveryWidget extends StatefulWidget {
  const MindeliveryWidget({
    Key? key,
    this.brand,
    this.code,
  }) : super(key: key);

  final String? brand;
  final String? code;

  @override
  _MindeliveryWidgetState createState() => _MindeliveryWidgetState();
}

class _MindeliveryWidgetState extends State<MindeliveryWidget> {
  late MindeliveryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindeliveryModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final minDelivery = FFAppState()
              .sr
              .where((e) =>
                  ('\"${e.code}\"' == widget.brand) &&
                  ('\"${e.brand}\"' == widget.code))
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
            itemCount: minDelivery.length,
            itemBuilder: (context, minDeliveryIndex) {
              final minDeliveryItem = minDelivery[minDeliveryIndex];
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'МИН. СРОК',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Roboto Condensed',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          minDeliveryItem.rejects.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Asap Condensed',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                                  .doubleToPerc(minDeliveryItem.rejects)!,
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
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Asap Condensed',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                          minDeliveryItem.price.toString(),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Text(
                          '${minDeliveryItem.amount.toString()} ${minDeliveryItem.unit}',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      () {
                        if (dateTimeFormat(
                              'yMd',
                              functions.newCustomFunction3(
                                  minDeliveryItem.deliveryTime),
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
                              functions.newCustomFunction3(
                                  minDeliveryItem.deliveryTime),
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
                            functions.newCustomFunction3(
                                minDeliveryItem.deliveryTime),
                            locale:
                                FFLocalizations.of(context).languageShortCode ??
                                    FFLocalizations.of(context).languageCode,
                          );
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).labelSmall,
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
              );
            },
          );
        },
      ),
    );
  }
}
