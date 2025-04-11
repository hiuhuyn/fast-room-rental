import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_text_model.dart';
export 'empty_text_model.dart';

class EmptyTextWidget extends StatefulWidget {
  const EmptyTextWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<EmptyTextWidget> createState() => _EmptyTextWidgetState();
}

class _EmptyTextWidgetState extends State<EmptyTextWidget> {
  late EmptyTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.text != null && widget.text != '',
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.text!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
