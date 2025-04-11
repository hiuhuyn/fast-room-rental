import '/common/component/item_media_url/item_media_url_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_post_view_tenant_favorite_widget.dart'
    show ItemPostViewTenantFavoriteWidget;
import 'package:flutter/material.dart';

class ItemPostViewTenantFavoriteModel
    extends FlutterFlowModel<ItemPostViewTenantFavoriteWidget> {
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
