import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bt_select_utilities_widget.dart' show BtSelectUtilitiesWidget;
import 'package:flutter/material.dart';

class BtSelectUtilitiesModel extends FlutterFlowModel<BtSelectUtilitiesWidget> {
  ///  Local state fields for this component.

  List<UtilitiesRow> cpSelects = [];
  void addToCpSelects(UtilitiesRow item) => cpSelects.add(item);
  void removeFromCpSelects(UtilitiesRow item) => cpSelects.remove(item);
  void removeAtIndexFromCpSelects(int index) => cpSelects.removeAt(index);
  void insertAtIndexInCpSelects(int index, UtilitiesRow item) =>
      cpSelects.insert(index, item);
  void updateCpSelectsAtIndex(int index, Function(UtilitiesRow) updateFn) =>
      cpSelects[index] = updateFn(cpSelects[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
