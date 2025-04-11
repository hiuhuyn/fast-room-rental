import '/backend/supabase/supabase.dart';
import '/common/component/messenger/item_chat_overview/item_chat_overview_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_landlord_widget.dart' show ChatLandlordWidget;
import 'package:flutter/material.dart';

class ChatLandlordModel extends FlutterFlowModel<ChatLandlordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Stream<List<ChatsRow>>? containerSupabaseStream;
  // Models for itemChatOverview dynamic component.
  late FlutterFlowDynamicModels<ItemChatOverviewModel> itemChatOverviewModels;

  @override
  void initState(BuildContext context) {
    itemChatOverviewModels =
        FlutterFlowDynamicModels(() => ItemChatOverviewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    itemChatOverviewModels.dispose();
  }
}
