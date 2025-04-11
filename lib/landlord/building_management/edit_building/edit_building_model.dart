import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/landlord/components/item_room_root/item_room_root_widget.dart';
import '/index.dart';
import 'dart:async';
import 'edit_building_widget.dart' show EditBuildingWidget;
import 'package:flutter/material.dart';

class EditBuildingModel extends FlutterFlowModel<EditBuildingWidget> {
  ///  Local state fields for this page.

  WardsRow? ward;

  CitiesRow? city;

  DistrictsRow? districts;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for tfNameNew widget.
  FocusNode? tfNameNewFocusNode;
  TextEditingController? tfNameNewTextController;
  String? Function(BuildContext, String?)? tfNameNewTextControllerValidator;
  String? _tfNameNewTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Tên toà nhà không được để trống';
    }

    return null;
  }

  // State field(s) for tfAddressNew widget.
  FocusNode? tfAddressNewFocusNode;
  TextEditingController? tfAddressNewTextController;
  String? Function(BuildContext, String?)? tfAddressNewTextControllerValidator;
  String? _tfAddressNewTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Địa chỉ không được để trống';
    }

    return null;
  }

  // State field(s) for tfPhoneNew widget.
  FocusNode? tfPhoneNewFocusNode;
  TextEditingController? tfPhoneNewTextController;
  String? Function(BuildContext, String?)? tfPhoneNewTextControllerValidator;
  String? _tfPhoneNewTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Số điện thoại không được để trống';
    }

    return null;
  }

  // State field(s) for SwPetNew widget.
  bool? swPetNewValue;
  // State field(s) for tfInternetNew widget.
  FocusNode? tfInternetNewFocusNode;
  TextEditingController? tfInternetNewTextController;
  String? Function(BuildContext, String?)? tfInternetNewTextControllerValidator;
  // State field(s) for tfElectricityNew widget.
  FocusNode? tfElectricityNewFocusNode;
  TextEditingController? tfElectricityNewTextController;
  String? Function(BuildContext, String?)?
      tfElectricityNewTextControllerValidator;
  // State field(s) for tfWaterNew widget.
  FocusNode? tfWaterNewFocusNode;
  TextEditingController? tfWaterNewTextController;
  String? Function(BuildContext, String?)? tfWaterNewTextControllerValidator;
  // State field(s) for ddTypeWaterNew widget.
  String? ddTypeWaterNewValue;
  FormFieldController<String>? ddTypeWaterNewValueController;
  // State field(s) for tfServicesNew widget.
  FocusNode? tfServicesNewFocusNode;
  TextEditingController? tfServicesNewTextController;
  String? Function(BuildContext, String?)? tfServicesNewTextControllerValidator;
  // State field(s) for tfNameEdit widget.
  FocusNode? tfNameEditFocusNode;
  TextEditingController? tfNameEditTextController;
  String? Function(BuildContext, String?)? tfNameEditTextControllerValidator;
  String? _tfNameEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Tên toà nhà không được trống';
    }

    return null;
  }

  // State field(s) for tfAddressEdit widget.
  FocusNode? tfAddressEditFocusNode;
  TextEditingController? tfAddressEditTextController;
  String? Function(BuildContext, String?)? tfAddressEditTextControllerValidator;
  String? _tfAddressEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Địa chỉ không được trống';
    }

    return null;
  }

  // State field(s) for tfPhoneEdit widget.
  FocusNode? tfPhoneEditFocusNode;
  TextEditingController? tfPhoneEditTextController;
  String? Function(BuildContext, String?)? tfPhoneEditTextControllerValidator;
  String? _tfPhoneEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Số điện thoại không được trống';
    }

    return null;
  }

  // State field(s) for SwPetEdit widget.
  bool? swPetEditValue;
  // State field(s) for tfInternetEdit widget.
  FocusNode? tfInternetEditFocusNode;
  TextEditingController? tfInternetEditTextController;
  String? Function(BuildContext, String?)?
      tfInternetEditTextControllerValidator;
  // State field(s) for tfElectricityEdit widget.
  FocusNode? tfElectricityEditFocusNode;
  TextEditingController? tfElectricityEditTextController;
  String? Function(BuildContext, String?)?
      tfElectricityEditTextControllerValidator;
  String? _tfElectricityEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Giá điện không được trống';
    }

    return null;
  }

  // State field(s) for tfWaterEdit widget.
  FocusNode? tfWaterEditFocusNode;
  TextEditingController? tfWaterEditTextController;
  String? Function(BuildContext, String?)? tfWaterEditTextControllerValidator;
  // State field(s) for ddTypeWaterEdit widget.
  String? ddTypeWaterEditValue;
  FormFieldController<String>? ddTypeWaterEditValueController;
  // State field(s) for tfServicesEdit widget.
  FocusNode? tfServicesEditFocusNode;
  TextEditingController? tfServicesEditTextController;
  String? Function(BuildContext, String?)?
      tfServicesEditTextControllerValidator;
  Completer<List<BuildingSummaryViewRow>>? requestCompleter;
  // Models for itemRoomRoot dynamic component.
  late FlutterFlowDynamicModels<ItemRoomRootModel> itemRoomRootModels;

  @override
  void initState(BuildContext context) {
    tfNameNewTextControllerValidator = _tfNameNewTextControllerValidator;
    tfAddressNewTextControllerValidator = _tfAddressNewTextControllerValidator;
    tfPhoneNewTextControllerValidator = _tfPhoneNewTextControllerValidator;
    tfNameEditTextControllerValidator = _tfNameEditTextControllerValidator;
    tfAddressEditTextControllerValidator =
        _tfAddressEditTextControllerValidator;
    tfPhoneEditTextControllerValidator = _tfPhoneEditTextControllerValidator;
    tfElectricityEditTextControllerValidator =
        _tfElectricityEditTextControllerValidator;
    itemRoomRootModels = FlutterFlowDynamicModels(() => ItemRoomRootModel());
  }

  @override
  void dispose() {
    tfNameNewFocusNode?.dispose();
    tfNameNewTextController?.dispose();

    tfAddressNewFocusNode?.dispose();
    tfAddressNewTextController?.dispose();

    tfPhoneNewFocusNode?.dispose();
    tfPhoneNewTextController?.dispose();

    tfInternetNewFocusNode?.dispose();
    tfInternetNewTextController?.dispose();

    tfElectricityNewFocusNode?.dispose();
    tfElectricityNewTextController?.dispose();

    tfWaterNewFocusNode?.dispose();
    tfWaterNewTextController?.dispose();

    tfServicesNewFocusNode?.dispose();
    tfServicesNewTextController?.dispose();

    tfNameEditFocusNode?.dispose();
    tfNameEditTextController?.dispose();

    tfAddressEditFocusNode?.dispose();
    tfAddressEditTextController?.dispose();

    tfPhoneEditFocusNode?.dispose();
    tfPhoneEditTextController?.dispose();

    tfInternetEditFocusNode?.dispose();
    tfInternetEditTextController?.dispose();

    tfElectricityEditFocusNode?.dispose();
    tfElectricityEditTextController?.dispose();

    tfWaterEditFocusNode?.dispose();
    tfWaterEditTextController?.dispose();

    tfServicesEditFocusNode?.dispose();
    tfServicesEditTextController?.dispose();

    itemRoomRootModels.dispose();
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
