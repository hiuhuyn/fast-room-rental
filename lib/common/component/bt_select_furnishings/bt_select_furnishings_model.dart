import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bt_select_furnishings_widget.dart' show BtSelectFurnishingsWidget;
import 'package:flutter/material.dart';

class BtSelectFurnishingsModel
    extends FlutterFlowModel<BtSelectFurnishingsWidget> {
  ///  Local state fields for this component.

  List<FurnishingsRow> cpSelects = [];
  void addToCpSelects(FurnishingsRow item) => cpSelects.add(item);
  void removeFromCpSelects(FurnishingsRow item) => cpSelects.remove(item);
  void removeAtIndexFromCpSelects(int index) => cpSelects.removeAt(index);
  void insertAtIndexInCpSelects(int index, FurnishingsRow item) =>
      cpSelects.insert(index, item);
  void updateCpSelectsAtIndex(int index, Function(FurnishingsRow) updateFn) =>
      cpSelects[index] = updateFn(cpSelects[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
