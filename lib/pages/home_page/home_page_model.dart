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
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (BRANDS)] action in TextField widget.
  ApiCallResponse? apiResultnpb;
  // Stores action output result for [Custom Action - jsonBrandCodeSearchResult] action in TextField widget.
  List<BrandCodeSearchItemStruct>? data;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // Stores action output result for [Backend Call - API (FULLSEARCH)] action in Column widget.
  ApiCallResponse? apiResultf7sa;
  // Stores action output result for [Custom Action - dtSR] action in Column widget.
  List<SearchResultStruct>? dtsr1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for SEARCHED-ARTICUL widget.
  late ExpandableController searchedArticulController;

  // State field(s) for BRAND-CODE-NAME widget.
  ScrollController? brandCodeName;
  // State field(s) for MIN-PRICE widget.
  ScrollController? minPrice;
  // State field(s) for MIN-DATE widget.
  ScrollController? minDate;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // State field(s) for ANALOGS-AND-CROSS widget.
  late ExpandableController analogsAndCrossController;

  // State field(s) for ListView widget.
  ScrollController? listViewController5;
  // State field(s) for ListView widget.
  ScrollController? listViewController6;
  // State field(s) for ListView widget.
  ScrollController? listViewController7;
  // State field(s) for ListView widget.
  ScrollController? listViewController8;
  // State field(s) for ListView widget.
  ScrollController? listViewController9;
  // State field(s) for ListView widget.
  ScrollController? listViewController10;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController1 = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    columnController2 = ScrollController();
    brandCodeName = ScrollController();
    minPrice = ScrollController();
    minDate = ScrollController();
    listViewController3 = ScrollController();
    listViewController4 = ScrollController();
    listViewController5 = ScrollController();
    listViewController6 = ScrollController();
    listViewController7 = ScrollController();
    listViewController8 = ScrollController();
    listViewController9 = ScrollController();
    listViewController10 = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController1?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewController1?.dispose();
    listViewController2?.dispose();
    columnController2?.dispose();
    searchedArticulController.dispose();
    brandCodeName?.dispose();
    minPrice?.dispose();
    minDate?.dispose();
    listViewController3?.dispose();
    expandableController1.dispose();
    listViewController4?.dispose();
    analogsAndCrossController.dispose();
    listViewController5?.dispose();
    listViewController6?.dispose();
    listViewController7?.dispose();
    listViewController8?.dispose();
    listViewController9?.dispose();
    listViewController10?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
