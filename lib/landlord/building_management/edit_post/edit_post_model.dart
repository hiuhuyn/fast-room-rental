import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/landlord/components/item_room_root/item_room_root_widget.dart';
import 'dart:async';
import 'edit_post_widget.dart' show EditPostWidget;
import 'package:flutter/material.dart';

class EditPostModel extends FlutterFlowModel<EditPostWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfTitle widget.
  FocusNode? tfTitleFocusNode;
  TextEditingController? tfTitleTextController;
  String? Function(BuildContext, String?)? tfTitleTextControllerValidator;
  String? _tfTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Tiêu đề bài viết đang trống';
    }

    return null;
  }

  // State field(s) for ddBuilding widget.
  String? ddBuildingValue;
  FormFieldController<String>? ddBuildingValueController;
  Completer<List<RoomSummaryViewRow>>? requestCompleter;
  // State field(s) for ddRoom widget.
  String? ddRoomValue;
  FormFieldController<String>? ddRoomValueController;
  // Model for itemRoomRoot component.
  late ItemRoomRootModel itemRoomRootModel;

  @override
  void initState(BuildContext context) {
    tfTitleTextControllerValidator = _tfTitleTextControllerValidator;
    itemRoomRootModel = createModel(context, () => ItemRoomRootModel());
  }

  @override
  void dispose() {
    tfTitleFocusNode?.dispose();
    tfTitleTextController?.dispose();

    itemRoomRootModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
