import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'codeitemheader_model.dart';
export 'codeitemheader_model.dart';

class CodeitemheaderWidget extends StatefulWidget {
  const CodeitemheaderWidget({
    Key? key,
    this.brand,
    this.code,
  }) : super(key: key);

  final String? brand;
  final String? code;

  @override
  _CodeitemheaderWidgetState createState() => _CodeitemheaderWidgetState();
}

class _CodeitemheaderWidgetState extends State<CodeitemheaderWidget> {
  late CodeitemheaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodeitemheaderModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final codeItems = FFAppState()
              .sr
              .where((e) =>
                  ('\"${e.code}\"' == widget.brand) &&
                  ('\"${e.brand}\"' == widget.code))
              .toList()
              .take(1)
              .toList();
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: codeItems.length,
            itemBuilder: (context, codeItemsIndex) {
              final codeItemsItem = codeItems[codeItemsIndex];
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    codeItemsItem.code,
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    decoration: BoxDecoration(),
                    child: Text(
                      codeItemsItem.name,
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
