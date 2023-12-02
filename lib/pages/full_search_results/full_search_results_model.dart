import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'full_search_results_widget.dart' show FullSearchResultsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FullSearchResultsModel extends FlutterFlowModel<FullSearchResultsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (SR)] action in fullSearchResults widget.
  ApiCallResponse? apiResultf7s;
  // Stores action output result for [Custom Action - dtSR] action in fullSearchResults widget.
  List<SearchResultStruct>? dtsr;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}