import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cb_my_posts_widget.dart' show CbMyPostsWidget;
import 'package:flutter/material.dart';

class CbMyPostsModel extends FlutterFlowModel<CbMyPostsWidget> {
  ///  Local state fields for this component.

  PostRoomViewRow? postSelect;

  ///  State fields for stateful widgets in this component.

  // Models for itemPostViewTenant dynamic component.
  late FlutterFlowDynamicModels<ItemPostViewTenantModel>
      itemPostViewTenantModels;

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
