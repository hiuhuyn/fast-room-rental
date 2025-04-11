import '/flutter_flow/flutter_flow_util.dart';
import '/landlord/components/item_post_home/item_post_home_widget.dart';
import '/index.dart';
import 'all_my_posts_widget.dart' show AllMyPostsWidget;
import 'package:flutter/material.dart';

class AllMyPostsModel extends FlutterFlowModel<AllMyPostsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for itemPostHome dynamic component.
  late FlutterFlowDynamicModels<ItemPostHomeModel> itemPostHomeModels;

  @override
  void initState(BuildContext context) {
    itemPostHomeModels = FlutterFlowDynamicModels(() => ItemPostHomeModel());
  }

  @override
  void dispose() {
    itemPostHomeModels.dispose();
  }
}
