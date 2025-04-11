import '/backend/supabase/supabase.dart';
import '/common/component/item_notificaiton/item_notificaiton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_landlord_widget.dart' show NotificationLandlordWidget;
import 'package:flutter/material.dart';

class NotificationLandlordModel
    extends FlutterFlowModel<NotificationLandlordWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<NotificationsRow>>? listViewSupabaseStream;
  // Models for itemNotificaiton dynamic component.
  late FlutterFlowDynamicModels<ItemNotificaitonModel> itemNotificaitonModels;

  @override
  void initState(BuildContext context) {
    itemNotificaitonModels =
        FlutterFlowDynamicModels(() => ItemNotificaitonModel());
  }

  @override
  void dispose() {
    itemNotificaitonModels.dispose();
  }
}
