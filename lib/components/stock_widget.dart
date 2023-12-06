import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stock_model.dart';
export 'stock_model.dart';

class StockWidget extends StatefulWidget {
  const StockWidget({
    Key? key,
    this.brand,
    this.code,
  }) : super(key: key);

  final String? brand;
  final String? code;

  @override
  _StockWidgetState createState() => _StockWidgetState();
}

class _StockWidgetState extends State<StockWidget> {
  late StockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
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
                  ('\"${e.code}\"' == widget.brand) &&
                  ('\"${e.brand}\"' == widget.code) &&
                  (e.stock == 1))
              .toList()
              .length !=
          0,
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Text(
                'Наличие',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
            Builder(
              builder: (context) {
                final codeItems = FFAppState()
                    .sr
                    .where((e) =>
                        ('\"${e.code}\"' == widget.brand) &&
                        ('\"${e.brand}\"' == widget.code) &&
                        (e.stock == 1))
                    .toList()
                    .take(3)
                    .toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: codeItems.length,
                  itemBuilder: (context, codeItemsIndex) {
                    final codeItemsItem = codeItems[codeItemsIndex];
                    return Text(
                      'Наличие${widget.brand} ${codeItemsItem.brand}',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    );
                  },
                );
              },
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: ExpandableNotifier(
                  controller: _model.expandableController,
                  child: ExpandablePanel(
                    header: Text(
                      'Еще на 12 складах АВТОЕВРО',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Roboto Condensed',
                            color: Colors.black,
                          ),
                    ),
                    collapsed: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing...',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Asap Condensed',
                                    color: Color(0x8A000000),
                                  ),
                        ),
                      ),
                    ),
                    expanded: Builder(
                      builder: (context) {
                        final codeItems = FFAppState()
                            .sr
                            .where((e) =>
                                ('\"${e.code}\"' == widget.brand) &&
                                ('\"${e.brand}\"' == widget.code) &&
                                (e.stock == 1))
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: codeItems.length,
                          itemBuilder: (context, codeItemsIndex) {
                            final codeItemsItem = codeItems[codeItemsIndex];
                            return Visibility(
                              visible: codeItemsIndex > 3,
                              child: Text(
                                'Наличие${widget.brand} ${codeItemsItem.brand}',
                                style: FlutterFlowTheme.of(context).titleSmall,
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
                      hasIcon: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
