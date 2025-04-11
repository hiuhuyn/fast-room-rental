import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'landlord_information_widget.dart' show LandlordInformationWidget;
import 'package:flutter/material.dart';

class LandlordInformationModel
    extends FlutterFlowModel<LandlordInformationWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for itemPostViewTenant dynamic component.
  late FlutterFlowDynamicModels<ItemPostViewTenantModel>
      itemPostViewTenantModels;
  // Stores action output result for [Backend Call - Query Rows] action in FloatingActionButton widget.
  List<ChatOverviewRow>? qrChatViewCheck;
  // Stores action output result for [Backend Call - Insert Row] action in FloatingActionButton widget.
  ChatsRow? insertChat;
  // Stores action output result for [Backend Call - Query Rows] action in FloatingActionButton widget.
  List<ChatOverviewRow>? qrChatView2;

  @override
  void initState(BuildContext context) {
    itemPostViewTenantModels =
        FlutterFlowDynamicModels(() => ItemPostViewTenantModel());
  }

  @override
  void dispose() {
    itemPostViewTenantModels.dispose();
  }
}
