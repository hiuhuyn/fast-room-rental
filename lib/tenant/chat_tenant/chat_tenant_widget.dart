import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/messenger/item_chat_overview/item_chat_overview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/navigation_bar_tenant/navigation_bar_tenant_widget.dart';
import 'package:flutter/material.dart';
import 'chat_tenant_model.dart';
export 'chat_tenant_model.dart';

class ChatTenantWidget extends StatefulWidget {
  const ChatTenantWidget({super.key});

  static String routeName = 'ChatTenant';
  static String routePath = '/chats';

  @override
  State<ChatTenantWidget> createState() => _ChatTenantWidgetState();
}

class _ChatTenantWidgetState extends State<ChatTenantWidget> {
  late ChatTenantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTenantModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          if (_model.isSeach) {
                            return Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Tìm kiếm tin nhắn',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          prefixIcon: Icon(
                                            Icons.search_sharp,
                                            size: 30.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.isSeach = false;
                                        safeSetState(() {});
                                      },
                                      child: Text(
                                        'Huỷ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tin nhắn',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  if (false)
                                    FlutterFlowIconButton(
                                      borderRadius: 60.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.search,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.isSeach = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<ChatsRow>>(
                        stream: _model.containerSupabaseStream ??= SupaFlow
                            .client
                            .from("chats")
                            .stream(primaryKey: ['id'])
                            .order('last_message_time')
                            .order('created_at')
                            .map((list) =>
                                list.map((item) => ChatsRow(item)).toList()),
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
                          List<ChatsRow> containerChatsRowList = snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final containerVar = containerChatsRowList
                                      .sortedList(
                                          keyOf: (e) =>
                                              e.lastMessageTime != null
                                                  ? e.lastMessageTime!
                                                  : e.createdAt,
                                          desc: true)
                                      .toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      12.0,
                                      0,
                                      20.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: containerVar.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder: (context, containerVarIndex) {
                                      final containerVarItem =
                                          containerVar[containerVarIndex];
                                      return Visibility(
                                        visible: containerVarItem != null,
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<
                                              List<ChatOverviewRow>>(
                                            future: ChatOverviewTable()
                                                .querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'id',
                                                containerVarItem.id,
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
                                              List<ChatOverviewRow>
                                                  itemChatOverviewChatOverviewRowList =
                                                  snapshot.data!;

                                              final itemChatOverviewChatOverviewRow =
                                                  itemChatOverviewChatOverviewRowList
                                                          .isNotEmpty
                                                      ? itemChatOverviewChatOverviewRowList
                                                          .first
                                                      : null;

                                              return wrapWithModel(
                                                model: _model
                                                    .itemChatOverviewModels
                                                    .getModel(
                                                  containerVarItem.id,
                                                  containerVarIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemChatOverviewWidget(
                                                  key: Key(
                                                    'Keys6i_${containerVarItem.id}',
                                                  ),
                                                  chat:
                                                      itemChatOverviewChatOverviewRow!,
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.navigationBarTenantModel,
                updateCallback: () => safeSetState(() {}),
                child: NavigationBarTenantWidget(
                  page: PageTagNavigationBar.chat,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
