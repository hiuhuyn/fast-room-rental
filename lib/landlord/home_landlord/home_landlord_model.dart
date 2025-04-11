import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/landlord/components/item_post_home/item_post_home_widget.dart';
import '/landlord/components/item_potential_tenant/item_potential_tenant_widget.dart';
import '/index.dart';
import 'dart:async';
import 'home_landlord_widget.dart' show HomeLandlordWidget;
import 'package:flutter/material.dart';

class HomeLandlordModel extends FlutterFlowModel<HomeLandlordWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<BookingsViewRow>>? requestCompleter;
  Stream<List<NotificationsRow>>? containerSupabaseStream;
  // Models for itemPotentialTenant dynamic component.
  late FlutterFlowDynamicModels<ItemPotentialTenantModel>
      itemPotentialTenantModels;
  // Stores action output result for [Backend Call - Query Rows] action in itemPotentialTenant widget.
  List<ChatOverviewRow>? qrChat;
  // Stores action output result for [Backend Call - Query Rows] action in itemPotentialTenant widget.
  List<ChatOverviewRow>? qrUU2;
  // Stores action output result for [Backend Call - Insert Row] action in itemPotentialTenant widget.
  ChatsRow? insertUser;
  // Models for itemPostHomeLandlord.
  late FlutterFlowDynamicModels<ItemPostHomeModel> itemPostHomeLandlordModels;

  @override
  void initState(BuildContext context) {
    itemPotentialTenantModels =
        FlutterFlowDynamicModels(() => ItemPotentialTenantModel());
    itemPostHomeLandlordModels =
        FlutterFlowDynamicModels(() => ItemPostHomeModel());
  }

  @override
  void dispose() {
    itemPotentialTenantModels.dispose();
    itemPostHomeLandlordModels.dispose();
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
