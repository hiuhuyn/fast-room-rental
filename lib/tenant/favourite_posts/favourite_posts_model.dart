import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant_favorite/item_post_view_tenant_favorite_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favourite_posts_widget.dart' show FavouritePostsWidget;
import 'package:flutter/material.dart';

class FavouritePostsModel extends FlutterFlowModel<FavouritePostsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for itemPostViewTenantFavorite dynamic component.
  late FlutterFlowDynamicModels<ItemPostViewTenantFavoriteModel>
      itemPostViewTenantFavoriteModels;
  // Stores action output result for [Backend Call - Query Rows] action in itemPostViewTenantFavorite widget.
  List<PostRoomViewRow>? qrPost;

  @override
  void initState(BuildContext context) {
    itemPostViewTenantFavoriteModels =
        FlutterFlowDynamicModels(() => ItemPostViewTenantFavoriteModel());
  }

  @override
  void dispose() {
    itemPostViewTenantFavoriteModels.dispose();
  }
}
