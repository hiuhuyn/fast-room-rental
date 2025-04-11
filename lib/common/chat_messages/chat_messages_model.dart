import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/common/component/messenger/item_chat_messages/item_chat_messages_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_messages_widget.dart' show ChatMessagesWidget;
import 'package:flutter/material.dart';

class ChatMessagesModel extends FlutterFlowModel<ChatMessagesWidget> {
  ///  Local state fields for this page.

  int index = 0;

  PostRoomViewRow? cpPost;

  ///  State fields for stateful widgets in this page.

  Stream<List<MessagesRow>>? listViewSupabaseStream;
  // Models for itemChatMessages dynamic component.
  late FlutterFlowDynamicModels<ItemChatMessagesModel> itemChatMessagesModels;
  // Model for itemPostViewTenant component.
  late ItemPostViewTenantModel itemPostViewTenantModel;
  // State field(s) for tfMessages widget.
  FocusNode? tfMessagesFocusNode;
  TextEditingController? tfMessagesTextController;
  String? Function(BuildContext, String?)? tfMessagesTextControllerValidator;
  // Stores action output result for [Bottom Sheet - cbMyPosts] action in Icon widget.
  PostRoomViewRow? postValue;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  MessagesRow? insertMesageByPhoto;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  MediaRow? insertMediaLoop;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  MessagesRow? insertMesageByVideo;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  MediaRow? insertMediaVideo;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  MessagesRow? insertMessageNew;

  @override
  void initState(BuildContext context) {
    itemChatMessagesModels =
        FlutterFlowDynamicModels(() => ItemChatMessagesModel());
    itemPostViewTenantModel =
        createModel(context, () => ItemPostViewTenantModel());
  }

  @override
  void dispose() {
    itemChatMessagesModels.dispose();
    itemPostViewTenantModel.dispose();
    tfMessagesFocusNode?.dispose();
    tfMessagesTextController?.dispose();
  }
}
