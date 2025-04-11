import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'update_password_widget.dart' show UpdatePasswordWidget;
import 'package:flutter/material.dart';

class UpdatePasswordModel extends FlutterFlowModel<UpdatePasswordWidget> {
  ///  Local state fields for this page.

  bool isError = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfNew widget.
  FocusNode? tfNewFocusNode;
  TextEditingController? tfNewTextController;
  late bool tfNewVisibility;
  String? Function(BuildContext, String?)? tfNewTextControllerValidator;
  // State field(s) for tfConfig widget.
  FocusNode? tfConfigFocusNode;
  TextEditingController? tfConfigTextController;
  late bool tfConfigVisibility;
  String? Function(BuildContext, String?)? tfConfigTextControllerValidator;
  String? _tfConfigTextControllerValidator(BuildContext context, String? val) {
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

  @override
  void initState(BuildContext context) {
    tfNewVisibility = false;
    tfConfigVisibility = false;
    tfConfigTextControllerValidator = _tfConfigTextControllerValidator;
  }

  @override
  void dispose() {
    tfNewFocusNode?.dispose();
    tfNewTextController?.dispose();

    tfConfigFocusNode?.dispose();
    tfConfigTextController?.dispose();
  }
}
