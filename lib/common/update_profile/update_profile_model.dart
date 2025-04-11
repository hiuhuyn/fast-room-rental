import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_profile_widget.dart' show UpdateProfileWidget;
import 'package:flutter/material.dart';

class UpdateProfileModel extends FlutterFlowModel<UpdateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tfName widget.
  FocusNode? tfNameFocusNode;
  TextEditingController? tfNameTextController;
  String? Function(BuildContext, String?)? tfNameTextControllerValidator;
  // State field(s) for tfPhone widget.
  FocusNode? tfPhoneFocusNode;
  TextEditingController? tfPhoneTextController;
  String? Function(BuildContext, String?)? tfPhoneTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MediaRow? insertNewMedia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfNameFocusNode?.dispose();
    tfNameTextController?.dispose();

    tfPhoneFocusNode?.dispose();
    tfPhoneTextController?.dispose();
  }
}
