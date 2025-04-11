import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/landlord/components/item_appointments_landlord/item_appointments_landlord_widget.dart';
import 'dart:async';
import 'viewing_appointments_landlord_widget.dart'
    show ViewingAppointmentsLandlordWidget;
import 'package:flutter/material.dart';

class ViewingAppointmentsLandlordModel
    extends FlutterFlowModel<ViewingAppointmentsLandlordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for itemAppointmentsLandlord dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsLandlordModel>
      itemAppointmentsLandlordModels1;
  Completer<List<BookingsViewRow>>? requestCompleter;
  // Models for itemAppointmentsLandlord dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsLandlordModel>
      itemAppointmentsLandlordModels2;
  // Models for itemAppointmentsLandlord dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsLandlordModel>
      itemAppointmentsLandlordModels3;
  // Models for itemAppointmentsLandlord dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsLandlordModel>
      itemAppointmentsLandlordModels4;
  // Models for itemAppointmentsLandlord dynamic component.
  late FlutterFlowDynamicModels<ItemAppointmentsLandlordModel>
      itemAppointmentsLandlordModels5;

  @override
  void initState(BuildContext context) {
    itemAppointmentsLandlordModels1 =
        FlutterFlowDynamicModels(() => ItemAppointmentsLandlordModel());
    itemAppointmentsLandlordModels2 =
        FlutterFlowDynamicModels(() => ItemAppointmentsLandlordModel());
    itemAppointmentsLandlordModels3 =
        FlutterFlowDynamicModels(() => ItemAppointmentsLandlordModel());
    itemAppointmentsLandlordModels4 =
        FlutterFlowDynamicModels(() => ItemAppointmentsLandlordModel());
    itemAppointmentsLandlordModels5 =
        FlutterFlowDynamicModels(() => ItemAppointmentsLandlordModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemAppointmentsLandlordModels1.dispose();
    itemAppointmentsLandlordModels2.dispose();
    itemAppointmentsLandlordModels3.dispose();
    itemAppointmentsLandlordModels4.dispose();
    itemAppointmentsLandlordModels5.dispose();
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
