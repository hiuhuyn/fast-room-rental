import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_new_password_page_widget.dart' show CreateNewPasswordPageWidget;
import 'package:flutter/material.dart';

class CreateNewPasswordPageModel
    extends FlutterFlowModel<CreateNewPasswordPageWidget> {
  ///  Local state fields for this page.

  bool isErrorConfirmPassword = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập mật khẩu có tối thiểu 6 ký tự bao gồm số và chữ cái';
    }

    if (val.length < 6) {
      return 'Nhập mật khẩu có tối thiểu 6 ký';
    }

    if (!RegExp('^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]+\$').hasMatch(val)) {
      return 'Nhập mật khẩu gồm số và chữ cái';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập mật khẩu có tối thiểu 6 ký tự bao gồm số và chữ cái';
    }

    if (val.length < 6) {
      return 'Nhập mật khẩu có tối thiểu 6 ký tự';
    }

    if (!RegExp('^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]+\$').hasMatch(val)) {
      return 'Nhập mật khẩu gồm số và chữ cái';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (UpdatePassword)] action in Button widget.
  ApiCallResponse? apiUpdatePassword;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    textController1Validator = _textController1Validator;
    passwordVisibility2 = false;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
