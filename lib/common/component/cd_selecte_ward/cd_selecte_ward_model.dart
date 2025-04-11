import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cd_selecte_ward_widget.dart' show CdSelecteWardWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CdSelecteWardModel extends FlutterFlowModel<CdSelecteWardWidget> {
  ///  Local state fields for this component.

  CitiesRow? selectCity;

  DistrictsRow? selectDistricts;

  WardsRow? selectWard;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in cdSelecteWard widget.
  List<DistrictsRow>? districtsQR;
  // Stores action output result for [Backend Call - Query Rows] action in cdSelecteWard widget.
  List<CitiesRow>? cityQR;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<WardsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
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
