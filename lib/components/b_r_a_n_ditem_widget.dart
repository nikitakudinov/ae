import '/components/c_o_d_eitem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'b_r_a_n_ditem_model.dart';
export 'b_r_a_n_ditem_model.dart';

class BRANDitemWidget extends StatefulWidget {
  const BRANDitemWidget({Key? key}) : super(key: key);

  @override
  _BRANDitemWidgetState createState() => _BRANDitemWidgetState();
}

class _BRANDitemWidgetState extends State<BRANDitemWidget> {
  late BRANDitemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BRANDitemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Text(
              'STARTVOLT',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
          ),
        ),
        Expanded(
          child: wrapWithModel(
            model: _model.cODEitemModel,
            updateCallback: () => setState(() {}),
            child: CODEitemWidget(),
          ),
        ),
      ],
    );
  }
}
