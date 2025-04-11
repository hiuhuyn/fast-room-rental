import '/backend/supabase/supabase.dart';
import '/common/component/item_utility_and_furniture/item_utility_and_furniture_widget.dart';
import '/common/component/text_field_custom/text_field_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/landlord/components/item_post_home/item_post_home_widget.dart';
import '/index.dart';
import 'dart:async';
import 'edit_room_widget.dart' show EditRoomWidget;
import 'package:flutter/material.dart';

class EditRoomModel extends FlutterFlowModel<EditRoomWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> listMedia = [];
  void addToListMedia(FFUploadedFile item) => listMedia.add(item);
  void removeFromListMedia(FFUploadedFile item) => listMedia.remove(item);
  void removeAtIndexFromListMedia(int index) => listMedia.removeAt(index);
  void insertAtIndexInListMedia(int index, FFUploadedFile item) =>
      listMedia.insert(index, item);
  void updateListMediaAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listMedia[index] = updateFn(listMedia[index]);

  /// Tiện ích
  List<UtilitiesRow> utilities = [];
  void addToUtilities(UtilitiesRow item) => utilities.add(item);
  void removeFromUtilities(UtilitiesRow item) => utilities.remove(item);
  void removeAtIndexFromUtilities(int index) => utilities.removeAt(index);
  void insertAtIndexInUtilities(int index, UtilitiesRow item) =>
      utilities.insert(index, item);
  void updateUtilitiesAtIndex(int index, Function(UtilitiesRow) updateFn) =>
      utilities[index] = updateFn(utilities[index]);

  /// Nội thất
  List<FurnishingsRow> furnishings = [];
  void addToFurnishings(FurnishingsRow item) => furnishings.add(item);
  void removeFromFurnishings(FurnishingsRow item) => furnishings.remove(item);
  void removeAtIndexFromFurnishings(int index) => furnishings.removeAt(index);
  void insertAtIndexInFurnishings(int index, FurnishingsRow item) =>
      furnishings.insert(index, item);
  void updateFurnishingsAtIndex(int index, Function(FurnishingsRow) updateFn) =>
      furnishings[index] = updateFn(furnishings[index]);

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for tfNameNew widget.
  FocusNode? tfNameNewFocusNode;
  TextEditingController? tfNameNewTextController;
  String? Function(BuildContext, String?)? tfNameNewTextControllerValidator;
  String? _tfNameNewTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Trường này không được bỏ trống!';
    }

    return null;
  }

  // State field(s) for tfPriceNew widget.
  FocusNode? tfPriceNewFocusNode;
  TextEditingController? tfPriceNewTextController;
  String? Function(BuildContext, String?)? tfPriceNewTextControllerValidator;
  String? _tfPriceNewTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Trường này không được bỏ trống!';
    }

    return null;
  }

  // State field(s) for ddTypeRoomNew widget.
  int? ddTypeRoomNewValue;
  FormFieldController<int>? ddTypeRoomNewValueController;
  // State field(s) for tfHorizontalNew widget.
  FocusNode? tfHorizontalNewFocusNode;
  TextEditingController? tfHorizontalNewTextController;
  String? Function(BuildContext, String?)?
      tfHorizontalNewTextControllerValidator;
  // State field(s) for tfVerticalNew widget.
  FocusNode? tfVerticalNewFocusNode;
  TextEditingController? tfVerticalNewTextController;
  String? Function(BuildContext, String?)? tfVerticalNewTextControllerValidator;
  // Models for itemUtilityAndFurniture dynamic component.
  late FlutterFlowDynamicModels<ItemUtilityAndFurnitureModel>
      itemUtilityAndFurnitureModels1;
  // Models for itemUtilityAndFurniture dynamic component.
  late FlutterFlowDynamicModels<ItemUtilityAndFurnitureModel>
      itemUtilityAndFurnitureModels2;
  // State field(s) for tfDescriptionNew widget.
  FocusNode? tfDescriptionNewFocusNode;
  TextEditingController? tfDescriptionNewTextController;
  String? Function(BuildContext, String?)?
      tfDescriptionNewTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RoomsRow? insertNewRoom;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MediaRow? insertMediaNew;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  MediaRow? insertMediaEdit;
  Completer<List<MediaRoomViewRow>>? requestCompleter3;
  // State field(s) for ddStatsRoomEdit widget.
  String? ddStatsRoomEditValue;
  FormFieldController<String>? ddStatsRoomEditValueController;
  // Model for textFieldCustom component.
  late TextFieldCustomModel textFieldCustomModel1;
  // Model for textFieldCustom component.
  late TextFieldCustomModel textFieldCustomModel2;
  // State field(s) for ddTypeRoomEdit widget.
  int? ddTypeRoomEditValue;
  FormFieldController<int>? ddTypeRoomEditValueController;
  // Models for itemUtilityAndFurniture dynamic component.
  late FlutterFlowDynamicModels<ItemUtilityAndFurnitureModel>
      itemUtilityAndFurnitureModels3;
  Completer<List<RoomFurnishingsViewRow>>? requestCompleter2;
  // Models for itemUtilityAndFurniture dynamic component.
  late FlutterFlowDynamicModels<ItemUtilityAndFurnitureModel>
      itemUtilityAndFurnitureModels4;
  Completer<List<RoomUtilitiesViewRow>>? requestCompleter1;
  // Model for textFieldCustom component.
  late TextFieldCustomModel textFieldCustomModel3;
  // Models for itemPostHome dynamic component.
  late FlutterFlowDynamicModels<ItemPostHomeModel> itemPostHomeModels;

  @override
  void initState(BuildContext context) {
    tfNameNewTextControllerValidator = _tfNameNewTextControllerValidator;
    tfPriceNewTextControllerValidator = _tfPriceNewTextControllerValidator;
    itemUtilityAndFurnitureModels1 =
        FlutterFlowDynamicModels(() => ItemUtilityAndFurnitureModel());
    itemUtilityAndFurnitureModels2 =
        FlutterFlowDynamicModels(() => ItemUtilityAndFurnitureModel());
    textFieldCustomModel1 = createModel(context, () => TextFieldCustomModel());
    textFieldCustomModel2 = createModel(context, () => TextFieldCustomModel());
    itemUtilityAndFurnitureModels3 =
        FlutterFlowDynamicModels(() => ItemUtilityAndFurnitureModel());
    itemUtilityAndFurnitureModels4 =
        FlutterFlowDynamicModels(() => ItemUtilityAndFurnitureModel());
    textFieldCustomModel3 = createModel(context, () => TextFieldCustomModel());
    itemPostHomeModels = FlutterFlowDynamicModels(() => ItemPostHomeModel());
  }

  @override
  void dispose() {
    tfNameNewFocusNode?.dispose();
    tfNameNewTextController?.dispose();

    tfPriceNewFocusNode?.dispose();
    tfPriceNewTextController?.dispose();

    tfHorizontalNewFocusNode?.dispose();
    tfHorizontalNewTextController?.dispose();

    tfVerticalNewFocusNode?.dispose();
    tfVerticalNewTextController?.dispose();

    itemUtilityAndFurnitureModels1.dispose();
    itemUtilityAndFurnitureModels2.dispose();
    tfDescriptionNewFocusNode?.dispose();
    tfDescriptionNewTextController?.dispose();

    textFieldCustomModel1.dispose();
    textFieldCustomModel2.dispose();
    itemUtilityAndFurnitureModels3.dispose();
    itemUtilityAndFurnitureModels4.dispose();
    textFieldCustomModel3.dispose();
    itemPostHomeModels.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
