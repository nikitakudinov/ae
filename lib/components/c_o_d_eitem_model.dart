import '/components/m_i_ncost_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_o_d_eitem_widget.dart' show CODEitemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CODEitemModel extends FlutterFlowModel<CODEitemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MINcost component.
  late MINcostModel mINcostModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mINcostModel = createModel(context, () => MINcostModel());
  }

  void dispose() {
    mINcostModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
