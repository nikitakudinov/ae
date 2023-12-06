import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stock_model.dart';
export 'stock_model.dart';

class StockWidget extends StatefulWidget {
  const StockWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
  }) : super(key: key);

  final String? parameter1;
  final String? parameter2;

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
                  ('\"${e.code}\"' == widget.parameter1) &&
                  ('\"${e.brand}\"' == widget.parameter2) &&
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
                        ('\"${e.code}\"' == widget.parameter1) &&
                        ('\"${e.brand}\"' == widget.parameter2) &&
                        (e.stock == 1))
                    .toList()
                    .take(5)
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
                      'Наличие${widget.parameter1} ${codeItemsItem.brand}',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
