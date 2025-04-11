import '/flutter_flow/flutter_flow_util.dart';
import 'bt_select_furnishings_update_widget.dart'
    show BtSelectFurnishingsUpdateWidget;
import 'package:flutter/material.dart';

class BtSelectFurnishingsUpdateModel
    extends FlutterFlowModel<BtSelectFurnishingsUpdateWidget> {
  ///  Local state fields for this component.

  List<int> cpSelects = [];
  void addToCpSelects(int item) => cpSelects.add(item);
  void removeFromCpSelects(int item) => cpSelects.remove(item);
  void removeAtIndexFromCpSelects(int index) => cpSelects.removeAt(index);
  void insertAtIndexInCpSelects(int index, int item) =>
      cpSelects.insert(index, item);
  void updateCpSelectsAtIndex(int index, Function(int) updateFn) =>
      cpSelects[index] = updateFn(cpSelects[index]);

  int index = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
