import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (BRANDS)] action in TextField widget.
  ApiCallResponse? apiResultnpb;
  // Stores action output result for [Custom Action - jsonBrandCodeSearchResult] action in TextField widget.
  List<BrandCodeSearchItemStruct>? data;
  // Stores action output result for [Backend Call - API (FULLSEARCH)] action in Column widget.
  ApiCallResponse? apiResultf7sa;
  // Stores action output result for [Custom Action - dtSR] action in Column widget.
  List<SearchResultStruct>? dtsr1;
  // State field(s) for SEARCHED-ARTICUL widget.
  late ExpandableController searchedArticulController;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for ANALOGS-AND-CROSS widget.
  late ExpandableController analogsAndCrossController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    searchedArticulController.dispose();
    expandableController1.dispose();
    analogsAndCrossController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
