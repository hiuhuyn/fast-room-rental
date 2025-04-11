import '/backend/supabase/supabase.dart';
import '/common/component/item_notificaiton/item_notificaiton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/navigation_bar_tenant/navigation_bar_tenant_widget.dart';
import 'notification_tenant_widget.dart' show NotificationTenantWidget;
import 'package:flutter/material.dart';

class NotificationTenantModel
    extends FlutterFlowModel<NotificationTenantWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<NotificationsRow>>? listViewSupabaseStream;
  // Models for itemNotificaiton dynamic component.
  late FlutterFlowDynamicModels<ItemNotificaitonModel> itemNotificaitonModels;
  // Model for navigationBarTenant component.
  late NavigationBarTenantModel navigationBarTenantModel;

  @override
  void initState(BuildContext context) {
    itemNotificaitonModels =
        FlutterFlowDynamicModels(() => ItemNotificaitonModel());
    navigationBarTenantModel =
        createModel(context, () => NavigationBarTenantModel());
  }

  @override
  void dispose() {
    itemNotificaitonModels.dispose();
    navigationBarTenantModel.dispose();
  }
}
