import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'minprice_model.dart';
export 'minprice_model.dart';

class MinpriceWidget extends StatefulWidget {
  const MinpriceWidget({
    Key? key,
    this.brand,
    this.code,
  }) : super(key: key);

  final String? brand;
  final String? code;

  @override
  _MinpriceWidgetState createState() => _MinpriceWidgetState();
}

class _MinpriceWidgetState extends State<MinpriceWidget> {
  late MinpriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinpriceModel());
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
      height: 20.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
