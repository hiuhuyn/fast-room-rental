import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/common/component/messenger/item_chat_messages/item_chat_messages_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/landlord/components/cb_my_posts/cb_my_posts_widget.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chat_messages_model.dart';
export 'chat_messages_model.dart';

class ChatMessagesWidget extends StatefulWidget {
  const ChatMessagesWidget({
    super.key,
    required this.chatId,
    this.post,
  });

  final String? chatId;
  final PostRoomViewRow? post;

  static String routeName = 'ChatMessages';
  static String routePath = '/chatMessages';

  @override
  State<ChatMessagesWidget> createState() => _ChatMessagesWidgetState();
}

class _ChatMessagesWidgetState extends State<ChatMessagesWidget> {
  late ChatMessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMessagesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.cpPost == null) {
        _model.cpPost = widget.post;
        safeSetState(() {});
      }
      await NotificationsTable().update(
        data: {
          'is_read': true,
        },
        matchingRows: (rows) => rows
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'target_id',
              widget.chatId,
            )
            .eqOrNull(
              'target_type',
              TypeNoti.message.name,
            )
            .eqOrNull(
              'is_read',
              false,
            ),
      );
    });

    _model.tfMessagesTextController ??= TextEditingController();
    _model.tfMessagesFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<ChatOverviewRow>>(
            future: ChatOverviewTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.chatId,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ChatOverviewRow> columnChatOverviewRowList = snapshot.data!;

              final columnChatOverviewRow = columnChatOverviewRowList.isNotEmpty
                  ? columnChatOverviewRowList.first
                  : null;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 35.0,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                LandlordInformationWidget.routeName,
                                queryParameters: {
                                  'id': serializeParam(
                                    columnChatOverviewRow.otherUser,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (columnChatOverviewRow
                                                ?.otherUserAvatar !=
                                            null &&
                                        columnChatOverviewRow
                                                ?.otherUserAvatar !=
                                            '') {
                                      return Container(
                                        width: 35.0,
                                        height: 35.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          columnChatOverviewRow!
                                              .otherUserAvatar!,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 35.0,
                                        height: 35.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/20230626211615-3a61_wm.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          columnChatOverviewRow!
                                              .otherUserUsername!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 12.0,
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    Text(
                                      columnChatOverviewRow.otherUserEmail!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 24.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: StreamBuilder<List<MessagesRow>>(
                        stream: _model.listViewSupabaseStream ??= SupaFlow
                            .client
                            .from("messages")
                            .stream(primaryKey: ['id'])
                            .eqOrNull(
                              'chat_id',
                              widget.chatId,
                            )
                            .order('created_at')
                            .map((list) =>
                                list.map((item) => MessagesRow(item)).toList()),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<MessagesRow> listViewMessagesRowList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              50.0,
                              0,
                              20.0,
                            ),
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewMessagesRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewMessagesRow =
                                  listViewMessagesRowList[listViewIndex];
                              return Visibility(
                                visible: listViewMessagesRow.id != '',
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: FutureBuilder<List<MessagesViewRow>>(
                                    future: MessagesViewTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        listViewMessagesRow.id,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MessagesViewRow>
                                          itemChatMessagesMessagesViewRowList =
                                          snapshot.data!;

                                      final itemChatMessagesMessagesViewRow =
                                          itemChatMessagesMessagesViewRowList
                                                  .isNotEmpty
                                              ? itemChatMessagesMessagesViewRowList
                                                  .first
                                              : null;

                                      return wrapWithModel(
                                        model: _model.itemChatMessagesModels
                                            .getModel(
                                          itemChatMessagesMessagesViewRow!.id!,
                                          listViewIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ItemChatMessagesWidget(
                                          key: Key(
                                            'Keypb9_${itemChatMessagesMessagesViewRow.id!}',
                                          ),
                                          messages:
                                              itemChatMessagesMessagesViewRow,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.cpPost != null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: wrapWithModel(
                                model: _model.itemPostViewTenantModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ItemPostViewTenantWidget(
                                  postView: _model.cpPost!,
                                ),
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller:
                                          _model.tfMessagesTextController,
                                      focusNode: _model.tfMessagesFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.tfMessagesTextController',
                                        Duration(milliseconds: 0),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Nhắn tin...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .tfMessagesTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((_model.tfMessagesTextController
                                                  .text ==
                                              '') &&
                                      !(_model.tfMessagesFocusNode?.hasFocus ??
                                          false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FutureBuilder<List<UserInfoViewRow>>(
                                            future: FFAppState().userInfor(
                                              requestFn: () =>
                                                  UserInfoViewTable()
                                                      .querySingleRow(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  currentUserUid,
                                                ),
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UserInfoViewRow>
                                                  containerUserInfoViewRowList =
                                                  snapshot.data!;

                                              final containerUserInfoViewRow =
                                                  containerUserInfoViewRowList
                                                          .isNotEmpty
                                                      ? containerUserInfoViewRowList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      containerUserInfoViewRow
                                                              ?.role ==
                                                          Role.landlord.name,
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  CbMyPostsWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.postValue =
                                                                  value));

                                                      if (_model.postValue !=
                                                          null) {
                                                        _model.cpPost =
                                                            _model.postValue;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.post_add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMedia(
                                                storageFolderPath:
                                                    widget.chatId,
                                                imageQuality: 80,
                                                mediaSource:
                                                    MediaSource.photoGallery,
                                                multiImage: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading1 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      await uploadSupabaseStorageFiles(
                                                    bucketName: 'media',
                                                    selectedFiles:
                                                        selectedMedia,
                                                  );
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading1 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFiles1 =
                                                        selectedUploadedFiles;
                                                    _model.uploadedFileUrls1 =
                                                        downloadUrls;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  safeSetState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }

                                              if (_model.uploadedFileUrls1
                                                  .isNotEmpty) {
                                                _model.index = 0;
                                                _model.insertMesageByPhoto =
                                                    await MessagesTable()
                                                        .insert({
                                                  'sender_id': currentUserUid,
                                                  'type':
                                                      MessageType.media.name,
                                                  'chat_id': widget.chatId,
                                                  'content': _model
                                                      .tfMessagesTextController
                                                      .text,
                                                });
                                                while (_model.index <
                                                    _model.uploadedFileUrls1
                                                        .length) {
                                                  _model.insertMediaLoop =
                                                      await MediaTable()
                                                          .insert({
                                                    'file_name': _model
                                                        .uploadedFileUrls1
                                                        .elementAtOrNull(
                                                            _model.index),
                                                    'user_id': currentUserUid,
                                                    'type':
                                                        MediaType.image.name,
                                                  });
                                                  await MediaMessagesTable()
                                                      .insert({
                                                    'message_id': _model
                                                        .insertMesageByPhoto
                                                        ?.id,
                                                    'media_id': _model
                                                        .insertMediaLoop?.id,
                                                  });
                                                  _model.index =
                                                      _model.index + 1;
                                                }
                                                safeSetState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFiles1 =
                                                      [];
                                                  _model.uploadedFileUrls1 = [];
                                                });

                                                safeSetState(() {
                                                  _model
                                                      .tfMessagesTextController
                                                      ?.clear();
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.image_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMedia(
                                                storageFolderPath:
                                                    widget.chatId,
                                                isVideo: true,
                                                mediaSource:
                                                    MediaSource.videoGallery,
                                                multiImage: false,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading2 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      await uploadSupabaseStorageFiles(
                                                    bucketName: 'media',
                                                    selectedFiles:
                                                        selectedMedia,
                                                  );
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading2 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile2 =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl2 =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  safeSetState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }

                                              if (_model.uploadedFileUrl2 !=
                                                      '') {
                                                _model.insertMesageByVideo =
                                                    await MessagesTable()
                                                        .insert({
                                                  'sender_id': currentUserUid,
                                                  'type':
                                                      MessageType.media.name,
                                                  'chat_id': widget.chatId,
                                                  'content': _model
                                                      .tfMessagesTextController
                                                      .text,
                                                });
                                                _model.insertMediaVideo =
                                                    await MediaTable().insert({
                                                  'file_name':
                                                      _model.uploadedFileUrl2,
                                                  'user_id': currentUserUid,
                                                  'type': MediaType.video.name,
                                                });
                                                await MediaMessagesTable()
                                                    .insert({
                                                  'message_id': _model
                                                      .insertMesageByVideo?.id,
                                                  'media_id': _model
                                                      .insertMediaVideo?.id,
                                                });
                                                safeSetState(() {
                                                  _model.isDataUploading2 =
                                                      false;
                                                  _model.uploadedLocalFile2 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl2 = '';
                                                });

                                                safeSetState(() {
                                                  _model
                                                      .tfMessagesTextController
                                                      ?.clear();
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.video_collection_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  if ((_model.tfMessagesTextController
                                                  .text !=
                                              '') ||
                                      (_model.tfMessagesFocusNode?.hasFocus ??
                                          false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 50.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        icon: Icon(
                                          Icons.send_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 20.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: (_model.tfMessagesTextController
                                                        .text ==
                                                    '')
                                            ? null
                                            : () async {
                                                _model.insertMessageNew =
                                                    await MessagesTable()
                                                        .insert({
                                                  'sender_id': currentUserUid,
                                                  'chat_id': widget.chatId,
                                                  'content': _model
                                                      .tfMessagesTextController
                                                      .text,
                                                  'type': _model.cpPost != null
                                                      ? MessageType.post.name
                                                      : MessageType.text.name,
                                                });
                                                if (_model.cpPost != null) {
                                                  await PostMessagesTable()
                                                      .insert({
                                                    'post_id':
                                                        _model.cpPost?.postId,
                                                    'message_id': _model
                                                        .insertMessageNew?.id,
                                                  });
                                                  _model.cpPost = null;
                                                  safeSetState(() {});
                                                }
                                                safeSetState(() {
                                                  _model
                                                      .tfMessagesTextController
                                                      ?.clear();
                                                });

                                                safeSetState(() {});
                                              },
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
