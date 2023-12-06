import '/components/m_i_ncost_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_o_d_eitem_model.dart';
export 'c_o_d_eitem_model.dart';

class CODEitemWidget extends StatefulWidget {
  const CODEitemWidget({
    Key? key,
    this.brand,
    this.code,
    this.stock,
  }) : super(key: key);

  final String? brand;
  final String? code;
  final int? stock;

  @override
  _CODEitemWidgetState createState() => _CODEitemWidgetState();
}

class _CODEitemWidgetState extends State<CODEitemWidget> {
  late CODEitemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CODEitemModel());
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
              'VSP 0805',
              style: FlutterFlowTheme.of(context).titleSmall,
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Text(
              'Свеча зажигания для а/м Hyundai Accent (Tagaz) (00-) 1.3i/1.5i (VSP 0805)\n',
              style: FlutterFlowTheme.of(context).titleSmall,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.mINcostModel,
          updateCallback: () => setState(() {}),
          child: MINcostWidget(
            brand: widget.brand,
            code: widget.code!,
            stock: widget.stock!,
          ),
        ),
      ],
    );
  }
}
