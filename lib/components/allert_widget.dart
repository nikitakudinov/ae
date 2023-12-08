import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'allert_model.dart';
export 'allert_model.dart';

class AllertWidget extends StatefulWidget {
  const AllertWidget({Key? key}) : super(key: key);

  @override
  _AllertWidgetState createState() => _AllertWidgetState();
}

class _AllertWidgetState extends State<AllertWidget> {
  late AllertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllertModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Color(0xFFD3D3D3),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off_sharp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 50.0,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          decoration: BoxDecoration(),
                          child: Text(
                            'По вашему запросу нет предложений',
                            style: FlutterFlowTheme.of(context).labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            setState(() {
                              FFAppState().sr = [];
                            });
                          },
                          text: 'OK',
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Asap Condensed',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
