import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_media_url/item_media_url_widget.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'item_chat_messages_model.dart';
export 'item_chat_messages_model.dart';

class ItemChatMessagesWidget extends StatefulWidget {
  const ItemChatMessagesWidget({
    super.key,
    required this.messages,
  });

  final MessagesViewRow? messages;

  @override
  State<ItemChatMessagesWidget> createState() => _ItemChatMessagesWidgetState();
}

class _ItemChatMessagesWidgetState extends State<ItemChatMessagesWidget> {
  late ItemChatMessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemChatMessagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (widget.messages?.senderId != currentUserUid) {
            return Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.isShowTime = !_model.isShowTime;
                    safeSetState(() {});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.messages?.content != null &&
                          widget.messages?.content != '')
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              widget.messages!.content!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      if ((widget.messages?.type == MessageType.media.name) &&
                          (widget.messages?.senderId != currentUserUid))
                        Container(
                          decoration: BoxDecoration(),
                          child: FutureBuilder<List<MediaMessagesViewRow>>(
                            future: MediaMessagesViewTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'message_id',
                                widget.messages?.id,
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
                              List<MediaMessagesViewRow>
                                  listViewMediaMessagesViewRowList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewMediaMessagesViewRowList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewMediaMessagesViewRow =
                                      listViewMediaMessagesViewRowList[
                                          listViewIndex];
                                  return wrapWithModel(
                                    model: _model.itemMediaUrlModels1.getModel(
                                      listViewMediaMessagesViewRow.id!
                                          .toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ItemMediaUrlWidget(
                                      key: Key(
                                        'Keyuzi_${listViewMediaMessagesViewRow.id!.toString()}',
                                      ),
                                      url:
                                          listViewMediaMessagesViewRow.fileName,
                                      radius: 8,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      onTap: (url, type) async {},
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      if (widget.messages?.type == MessageType.post.name)
                        FutureBuilder<List<PostRoomViewRow>>(
                          future: PostRoomViewTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'post_id',
                              widget.messages?.postId,
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
                            List<PostRoomViewRow>
                                itemPostViewTenantPostRoomViewRowList =
                                snapshot.data!;

                            final itemPostViewTenantPostRoomViewRow =
                                itemPostViewTenantPostRoomViewRowList.isNotEmpty
                                    ? itemPostViewTenantPostRoomViewRowList
                                        .first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  RoomDetailsPageWidget.routeName,
                                  queryParameters: {
                                    'post': serializeParam(
                                      itemPostViewTenantPostRoomViewRow,
                                      ParamType.SupabaseRow,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.itemPostViewTenantModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ItemPostViewTenantWidget(
                                  postView: itemPostViewTenantPostRoomViewRow!,
                                ),
                              ),
                            );
                          },
                        ),
                      if (_model.isShowTime)
                        Text(
                          dateTimeFormat(
                              "dd/MM/yyyy HH:mm", widget.messages!.createdAt!),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            );
          } else {
            return Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.isShowTime = !_model.isShowTime;
                    safeSetState(() {});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.messages?.content != null &&
                          widget.messages?.content != '')
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              widget.messages!.content!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      if ((widget.messages?.type == MessageType.media.name) &&
                          (widget.messages?.senderId == currentUserUid))
                        Container(
                          decoration: BoxDecoration(),
                          child: FutureBuilder<List<MediaMessagesViewRow>>(
                            future: MediaMessagesViewTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'message_id',
                                widget.messages?.id,
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
                              List<MediaMessagesViewRow>
                                  listViewMediaMessagesViewRowList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewMediaMessagesViewRowList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewMediaMessagesViewRow =
                                      listViewMediaMessagesViewRowList[
                                          listViewIndex];
                                  return wrapWithModel(
                                    model: _model.itemMediaUrlModels2.getModel(
                                      listViewMediaMessagesViewRow.id!
                                          .toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ItemMediaUrlWidget(
                                      key: Key(
                                        'Keyf28_${listViewMediaMessagesViewRow.id!.toString()}',
                                      ),
                                      url:
                                          listViewMediaMessagesViewRow.fileName,
                                      radius: 8,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      onTap: (url, type) async {},
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      if (widget.messages?.type == MessageType.post.name)
                        FutureBuilder<List<PostRoomViewRow>>(
                          future: PostRoomViewTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'post_id',
                              widget.messages?.postId,
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
                            List<PostRoomViewRow>
                                itemPostViewTenantPostRoomViewRowList =
                                snapshot.data!;

                            final itemPostViewTenantPostRoomViewRow =
                                itemPostViewTenantPostRoomViewRowList.isNotEmpty
                                    ? itemPostViewTenantPostRoomViewRowList
                                        .first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  RoomDetailsPageWidget.routeName,
                                  queryParameters: {
                                    'post': serializeParam(
                                      itemPostViewTenantPostRoomViewRow,
                                      ParamType.SupabaseRow,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.itemPostViewTenantModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ItemPostViewTenantWidget(
                                  postView: itemPostViewTenantPostRoomViewRow!,
                                ),
                              ),
                            );
                          },
                        ),
                      if (_model.isShowTime)
                        Text(
                          dateTimeFormat(
                              "dd/MM/yyyy HH:mm", widget.messages!.createdAt!),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
