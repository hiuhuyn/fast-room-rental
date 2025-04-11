import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_custom_widget.dart' show TextFieldCustomWidget;
import 'package:flutter/material.dart';

class TextFieldCustomModel extends FlutterFlowModel<TextFieldCustomWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
