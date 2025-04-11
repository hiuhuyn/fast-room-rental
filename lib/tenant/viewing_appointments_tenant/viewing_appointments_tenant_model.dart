import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/item_appointments_tenant/item_appointments_tenant_widget.dart';
import 'dart:async';
import 'viewing_appointments_tenant_widget.dart'
    show ViewingAppointmentsTenantWidget;
import 'package:flutter/material.dart';

class ViewingAppointmentsTenantModel
    extends FlutterFlowModel<ViewingAppointmentsTenantWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for itemAppointmentsTenant dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsTenantModel>
      itemAppointmentsTenantModels1;
  Completer<List<BookingsViewRow>>? requestCompleter;
  // Models for itemAppointmentsTenant dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsTenantModel>
      itemAppointmentsTenantModels2;
  // Models for itemAppointmentsTenant dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsTenantModel>
      itemAppointmentsTenantModels3;
  // Models for itemAppointmentsTenant dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsTenantModel>
      itemAppointmentsTenantModels4;
  // Models for itemAppointmentsTenant dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsTenantModel>
      itemAppointmentsTenantModels5;

  @override
  void initState(BuildContext context) {
    itemAppointmentsTenantModels1 =
        FlutterFlowDynamicModels(() => ItemAppointmentsTenantModel());
    itemAppointmentsTenantModels2 =
        FlutterFlowDynamicModels(() => ItemAppointmentsTenantModel());
    itemAppointmentsTenantModels3 =
        FlutterFlowDynamicModels(() => ItemAppointmentsTenantModel());
    itemAppointmentsTenantModels4 =
        FlutterFlowDynamicModels(() => ItemAppointmentsTenantModel());
    itemAppointmentsTenantModels5 =
        FlutterFlowDynamicModels(() => ItemAppointmentsTenantModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemAppointmentsTenantModels1.dispose();
    itemAppointmentsTenantModels2.dispose();
    itemAppointmentsTenantModels3.dispose();
    itemAppointmentsTenantModels4.dispose();
    itemAppointmentsTenantModels5.dispose();
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
