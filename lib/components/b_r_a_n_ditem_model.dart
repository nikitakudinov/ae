import '/components/c_o_d_eitem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_r_a_n_ditem_widget.dart' show BRANDitemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BRANDitemModel extends FlutterFlowModel<BRANDitemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CODEitem component.
  late CODEitemModel cODEitemModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cODEitemModel = createModel(context, () => CODEitemModel());
  }

  void dispose() {
    cODEitemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
