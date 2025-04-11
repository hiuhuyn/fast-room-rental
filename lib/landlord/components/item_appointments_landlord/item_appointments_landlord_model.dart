import '/backend/supabase/supabase.dart';
import '/common/component/item_media_url/item_media_url_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_appointments_landlord_widget.dart'
    show ItemAppointmentsLandlordWidget;
import 'package:flutter/material.dart';

class ItemAppointmentsLandlordModel
    extends FlutterFlowModel<ItemAppointmentsLandlordWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for itemMediaUrl component.
  late ItemMediaUrlModel itemMediaUrlModel;
  // Stores action output result for [Backend Call - Query Rows] action in RichTextSpan widget.
  List<PostRoomViewRow>? qrPostView;
  // Stores action output result for [Backend Call - Query Rows] action in RichText widget.
  List<ChatOverviewRow>? qrChat;
  // Stores action output result for [Backend Call - Insert Row] action in RichText widget.
  ChatsRow? insertChat;

  @override
  void initState(BuildContext context) {
    itemMediaUrlModel = createModel(context, () => ItemMediaUrlModel());
  }

  @override
  void dispose() {
    itemMediaUrlModel.dispose();
  }
}
