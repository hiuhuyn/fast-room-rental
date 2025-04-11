import '/backend/schema/enums/enums.dart';
import '/common/component/item_sort/item_sort_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cb_sort_rooms_widget.dart' show CbSortRoomsWidget;
import 'package:flutter/material.dart';

class CbSortRoomsModel extends FlutterFlowModel<CbSortRoomsWidget> {
  ///  Local state fields for this component.

  Sort? ctSort = Sort.newest;

  ///  State fields for stateful widgets in this component.

  // Model for itemSort component.
  late ItemSortModel itemSortModel;

  @override
  void initState(BuildContext context) {
    itemSortModel = createModel(context, () => ItemSortModel());
  }

  @override
  void dispose() {
    itemSortModel.dispose();
  }
}
