import '/common/component/item_building_summary_view/item_building_summary_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'building_management_widget.dart' show BuildingManagementWidget;
import 'package:flutter/material.dart';

class BuildingManagementModel
    extends FlutterFlowModel<BuildingManagementWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for itemBuildingSummaryView dynamic component.
  late FlutterFlowDynamicModels<ItemBuildingSummaryViewModel>
      itemBuildingSummaryViewModels;

  @override
  void initState(BuildContext context) {
    itemBuildingSummaryViewModels =
        FlutterFlowDynamicModels(() => ItemBuildingSummaryViewModel());
  }

  @override
  void dispose() {
    itemBuildingSummaryViewModels.dispose();
  }
}
