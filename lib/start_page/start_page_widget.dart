import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({Key? key}) : super(key: key);

  @override
  _StartPageWidgetState createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultf7s1 = await SupabaseGroup.srCall.call();
      if ((_model.apiResultf7s1?.succeeded ?? true)) {
        _model.dtsr = await actions.dtSR(
          functions
              .newCustomFunction4((_model.apiResultf7s1?.jsonBody ?? ''))
              ?.toList(),
        );
        setState(() {
          FFAppState().sr = _model.dtsr!.toList().cast<SearchResultStruct>();
          FFAppState().codes = functions
              .newCustomFunction2((SupabaseGroup.srCall.code(
                (_model.apiResultf7s1?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  ?.map((e) => e.toString())
                  .toList()
                  ?.toList())!
              .toList()
              .cast<String>();
          FFAppState().brands = functions
              .newCustomFunction2((SupabaseGroup.srCall.brand(
                (_model.apiResultf7s1?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  ?.toList())!
              .toList()
              .cast<String>();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.dehaze,
              color: Color(0xFFDC272B),
              size: 24.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Container(
            height: 25.0,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                'https://supabase.proplayclub.ru/storage/v1/object/public/playground/autoeuro-logo-s.png',
                height: 25.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    final brands = FFAppState().brands.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: brands.length,
                      itemBuilder: (context, brandsIndex) {
                        final brandsItem = brands[brandsIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                brandsItem,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final codes = FFAppState().codes.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: codes.length,
                                      itemBuilder: (context, codesIndex) {
                                        final codesItem = codes[codesIndex];
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                codesItem,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final codeItems = FFAppState()
                                                        .sr
                                                        .where((e) =>
                                                            '\"${e.code}\"' ==
                                                            codesItem)
                                                        .toList()
                                                        .take(5)
                                                        .toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          codeItems.length,
                                                      itemBuilder: (context,
                                                          codeItemsIndex) {
                                                        final codeItemsItem =
                                                            codeItems[
                                                                codeItemsIndex];
                                                        return Text(
                                                          codeItemsItem.code,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
