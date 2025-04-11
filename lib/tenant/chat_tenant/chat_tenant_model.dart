import '/backend/supabase/supabase.dart';
import '/common/component/messenger/item_chat_overview/item_chat_overview_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/navigation_bar_tenant/navigation_bar_tenant_widget.dart';
import 'chat_tenant_widget.dart' show ChatTenantWidget;
import 'package:flutter/material.dart';

class ChatTenantModel extends FlutterFlowModel<ChatTenantWidget> {
  ///  Local state fields for this page.

  bool isSeach = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Stream<List<ChatsRow>>? containerSupabaseStream;
  // Models for itemChatOverview dynamic component.
  late FlutterFlowDynamicModels<ItemChatOverviewModel> itemChatOverviewModels;
  // Model for navigationBarTenant component.
  late NavigationBarTenantModel navigationBarTenantModel;

  @override
  void initState(BuildContext context) {
    itemChatOverviewModels =
        FlutterFlowDynamicModels(() => ItemChatOverviewModel());
    navigationBarTenantModel =
        createModel(context, () => NavigationBarTenantModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    itemChatOverviewModels.dispose();
    navigationBarTenantModel.dispose();
  }
}
