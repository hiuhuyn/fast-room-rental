import '/common/component/item_media_url/item_media_url_widget.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_chat_messages_widget.dart' show ItemChatMessagesWidget;
import 'package:flutter/material.dart';

class ItemChatMessagesModel extends FlutterFlowModel<ItemChatMessagesWidget> {
  ///  Local state fields for this component.

  bool isShowTime = false;

  ///  State fields for stateful widgets in this component.

  // Models for itemMediaUrl dynamic component.
  late FlutterFlowDynamicModels<ItemMediaUrlModel> itemMediaUrlModels1;
  // Model for itemPostViewTenant component.
  late ItemPostViewTenantModel itemPostViewTenantModel1;
  // Models for itemMediaUrl dynamic component.
  late FlutterFlowDynamicModels<ItemMediaUrlModel> itemMediaUrlModels2;
  // Model for itemPostViewTenant component.
  late ItemPostViewTenantModel itemPostViewTenantModel2;

  @override
  void initState(BuildContext context) {
    itemMediaUrlModels1 = FlutterFlowDynamicModels(() => ItemMediaUrlModel());
    itemPostViewTenantModel1 =
        createModel(context, () => ItemPostViewTenantModel());
    itemMediaUrlModels2 = FlutterFlowDynamicModels(() => ItemMediaUrlModel());
    itemPostViewTenantModel2 =
        createModel(context, () => ItemPostViewTenantModel());
  }

  @override
  void dispose() {
    itemMediaUrlModels1.dispose();
    itemPostViewTenantModel1.dispose();
    itemMediaUrlModels2.dispose();
    itemPostViewTenantModel2.dispose();
  }
}
