import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cd_select_city_widget.dart' show CdSelectCityWidget;
import 'package:flutter/material.dart';

class CdSelectCityModel extends FlutterFlowModel<CdSelectCityWidget> {
  ///  Local state fields for this component.

  CitiesRow? selectCity;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
