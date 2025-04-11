import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'text_field_custom_model.dart';
export 'text_field_custom_model.dart';

class TextFieldCustomWidget extends StatefulWidget {
  const TextFieldCustomWidget({
    super.key,
    this.value,
    this.onSubmit,
    int? maxLine,
    int? minLine,
    required this.type,
  })  : this.maxLine = maxLine ?? 5,
        this.minLine = minLine ?? 1;

  final String? value;
  final Future Function(String value)? onSubmit;
  final int maxLine;
  final int minLine;
  final InputType? type;

  @override
  State<TextFieldCustomWidget> createState() => _TextFieldCustomWidgetState();
}

class _TextFieldCustomWidgetState extends State<TextFieldCustomWidget> {
  late TextFieldCustomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldCustomModel());

    _model.textFieldTextController ??=
        TextEditingController(text: widget.value);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.0, -1.0),
      children: [
        Container(
          width: double.infinity,
          child: TextFormField(
            controller: _model.textFieldTextController,
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textFieldTextController',
              Duration(milliseconds: 0),
              () => safeSetState(() {}),
            ),
            onFieldSubmitted: (_) async {
              if (_model.textFieldTextController.text != '') {
                await widget.onSubmit?.call(
                  _model.textFieldTextController.text,
                );
              }
            },
            autofocus: false,
            textInputAction: TextInputAction.done,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
              hintText: 'Nhập tên phòng hoặc mã phòng',
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Colors.transparent,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 50.0, 16.0),
              hoverColor: FlutterFlowTheme.of(context).hover,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
            maxLines: widget.maxLine,
            minLines: widget.minLine,
            cursorColor: FlutterFlowTheme.of(context).primaryText,
            validator:
                _model.textFieldTextControllerValidator.asValidator(context),
          ),
        ),
        if (_model.textFieldTextController.text != '')
          Padding(
            padding: EdgeInsets.all(4.0),
            child: FlutterFlowIconButton(
              borderRadius: 30.0,
              buttonSize: 30.0,
              fillColor: Color(0x6FC9C9C9),
              icon: Icon(
                Icons.check,
                color: FlutterFlowTheme.of(context).primary,
                size: 12.0,
              ),
              onPressed: () async {
                await widget.onSubmit?.call(
                  _model.textFieldTextController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Cập nhật thành công',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
