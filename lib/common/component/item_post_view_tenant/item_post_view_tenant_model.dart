import '/common/component/item_media_url/item_media_url_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_post_view_tenant_widget.dart' show ItemPostViewTenantWidget;
import 'package:flutter/material.dart';

class ItemPostViewTenantModel
    extends FlutterFlowModel<ItemPostViewTenantWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for itemMediaUrl component.
  late ItemMediaUrlModel itemMediaUrlModel;

  @override
  void initState(BuildContext context) {
    itemMediaUrlModel = createModel(context, () => ItemMediaUrlModel());
  }

  @override
  void dispose() {
    itemMediaUrlModel.dispose();
  }
}
