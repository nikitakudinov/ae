import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'full_search_results_model.dart';
export 'full_search_results_model.dart';

class FullSearchResultsWidget extends StatefulWidget {
  const FullSearchResultsWidget({
    Key? key,
    this.brand,
    this.code,
  }) : super(key: key);

  final String? brand;
  final String? code;

  @override
  _FullSearchResultsWidgetState createState() =>
      _FullSearchResultsWidgetState();
}

class _FullSearchResultsWidgetState extends State<FullSearchResultsWidget> {
  late FullSearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullSearchResultsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultf7s = await SupabaseGroup.testCall.call();
      if ((_model.apiResultf7s?.succeeded ?? true)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Запрос отправлен успешно'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        _model.dtSR = await actions.dtSEARCHRESULTS(
          functions
              .newCustomFunction((_model.apiResultf7s?.jsonBody ?? ''))
              ?.toList(),
        );
        setState(() {
          FFAppState().FullSearchResultItems =
              _model.dtSR!.toList().cast<FullSearchResultItemStruct>();
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Запрос не отправлен'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFAppState().FullSearchResultItems.length.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Builder(
                builder: (context) {
                  final results = FFAppState()
                      .FullSearchResultItems
                      .toList()
                      .take(5)
                      .toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: results.length,
                    itemBuilder: (context, resultsIndex) {
                      final resultsItem = results[resultsIndex];
                      return Text(
                        resultsItem.code,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
