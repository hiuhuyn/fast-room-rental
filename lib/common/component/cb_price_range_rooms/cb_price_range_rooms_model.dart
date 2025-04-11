import '/flutter_flow/flutter_flow_util.dart';
import 'cb_price_range_rooms_widget.dart' show CbPriceRangeRoomsWidget;
import 'package:flutter/material.dart';

class CbPriceRangeRoomsModel extends FlutterFlowModel<CbPriceRangeRoomsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tfMin widget.
  FocusNode? tfMinFocusNode;
  TextEditingController? tfMinTextController;
  String? Function(BuildContext, String?)? tfMinTextControllerValidator;
  // State field(s) for tfMax widget.
  FocusNode? tfMaxFocusNode;
  TextEditingController? tfMaxTextController;
  String? Function(BuildContext, String?)? tfMaxTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfMinFocusNode?.dispose();
    tfMinTextController?.dispose();

    tfMaxFocusNode?.dispose();
    tfMaxTextController?.dispose();
  }
}
