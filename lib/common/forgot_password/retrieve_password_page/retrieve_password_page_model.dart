import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'retrieve_password_page_widget.dart' show RetrievePasswordPageWidget;
import 'package:flutter/material.dart';

class RetrievePasswordPageModel
    extends FlutterFlowModel<RetrievePasswordPageWidget> {
  ///  Local state fields for this page.

  bool inputError = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfInput widget.
  FocusNode? tfInputFocusNode;
  TextEditingController? tfInputTextController;
  String? Function(BuildContext, String?)? tfInputTextControllerValidator;
  String? _tfInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(
            '^(?:\\d{11}|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,})\$')
        .hasMatch(val)) {
      return 'Email hoặc số điện thoại không hợp lệ';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (SendVerificationCode)] action in Button widget.
  ApiCallResponse? apiResult4b6;

  @override
  void initState(BuildContext context) {
    tfInputTextControllerValidator = _tfInputTextControllerValidator;
  }

  @override
  void dispose() {
    tfInputFocusNode?.dispose();
    tfInputTextController?.dispose();
  }
}
