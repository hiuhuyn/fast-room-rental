import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter_code_forgot_password_widget.dart'
    show EnterCodeForgotPasswordWidget;
import 'package:flutter/material.dart';

class EnterCodeForgotPasswordModel
    extends FlutterFlowModel<EnterCodeForgotPasswordWidget> {
  ///  Local state fields for this page.

  int time = 120;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfCode widget.
  FocusNode? tfCodeFocusNode;
  TextEditingController? tfCodeTextController;
  String? Function(BuildContext, String?)? tfCodeTextControllerValidator;
  String? _tfCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Hãy nhập mã của bạn';
    }

    if (val.length < 6) {
      return 'Mã của bạn gồm 6 chữ số';
    }
    if (val.length > 6) {
      return 'Mã của bạn gồm 6 chữ số';
    }
    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return 'Mã không hợp lệ';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (SendVerificationCode)] action in Icon widget.
  ApiCallResponse? sendApi;
  // Stores action output result for [Backend Call - API (CheckCode)] action in Button widget.
  ApiCallResponse? apiCheck;

  @override
  void initState(BuildContext context) {
    tfCodeTextControllerValidator = _tfCodeTextControllerValidator;
  }

  @override
  void dispose() {
    tfCodeFocusNode?.dispose();
    tfCodeTextController?.dispose();
  }
}
