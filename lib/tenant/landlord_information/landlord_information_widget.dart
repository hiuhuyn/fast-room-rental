import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'landlord_information_model.dart';
export 'landlord_information_model.dart';

class LandlordInformationWidget extends StatefulWidget {
  const LandlordInformationWidget({
    super.key,
    required this.id,
  });

  final String? id;

  static String routeName = 'LandlordInformation';
  static String routePath = '/landlordInformation';

  @override
  State<LandlordInformationWidget> createState() =>
      _LandlordInformationWidgetState();
}

class _LandlordInformationWidgetState extends State<LandlordInformationWidget> {
  late LandlordInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandlordInformationModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          leading: FlutterFlowIconButton(
            borderRadius: 50.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          centerTitle: false,
          title: Text(
            'Thông tin chủ trọ',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _model.qrChatViewCheck = await ChatOverviewTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'my_user',
                    currentUserUid,
                  )
                  .eqOrNull(
                    'other_user',
                    widget.id,
                  ),
            );
            if (_model.qrChatViewCheck != null &&
                (_model.qrChatViewCheck)!.isNotEmpty) {
              context.pushNamed(
                ChatMessagesWidget.routeName,
                queryParameters: {
                  'chatId': serializeParam(
                    _model.qrChatViewCheck?.firstOrNull?.id,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            } else {
              _model.insertChat = await ChatsTable().insert({
                'my_user': currentUserUid,
                'other_user': widget.id,
              });
              _model.qrChatView2 = await ChatOverviewTable().queryRows(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  _model.insertChat?.id,
                ),
              );
              if (_model.qrChatView2 != null &&
                  (_model.qrChatView2)!.isNotEmpty) {
                context.pushNamed(
                  ChatMessagesWidget.routeName,
                  queryParameters: {
                    'chatId': serializeParam(
                      _model.qrChatView2?.firstOrNull?.id,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Tạo trò chuyện thất bại vui lòng thử lại sau',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            }

            safeSetState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          elevation: 8.0,
          child: Icon(
            Icons.wechat_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<UserInfoViewRow>>(
            future: UserInfoViewTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.id,
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
              List<UserInfoViewRow> containerUserInfoViewRowList =
                  snapshot.data!;

              final containerUserInfoViewRow =
                  containerUserInfoViewRowList.isNotEmpty
                      ? containerUserInfoViewRowList.first
                      : null;

              return Container(
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 167.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/gacsep.jpeg',
                                ).image,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (containerUserInfoViewRow?.avtFileName !=
                                            null &&
                                        containerUserInfoViewRow?.avtFileName !=
                                            '') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: OctoImage(
                                          placeholderBuilder: (_) =>
                                              SizedBox.expand(
                                            child: Image(
                                              image: BlurHashImage(
                                                  containerUserInfoViewRow
                                                      .avtBlurHash!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          image: NetworkImage(
                                            containerUserInfoViewRow!
                                                .avtFileName!,
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.25,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.25,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/default_icon.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SelectionArea(
                            child: Text(
                          valueOrDefault<String>(
                            containerUserInfoViewRow?.username,
                            'Chủ trọ',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        )),
                      ),
                      SelectionArea(
                          child: Text(
                        valueOrDefault<String>(
                          containerUserInfoViewRow?.email,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      )),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Giới thiệu',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.push_pin_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Thời gian tham gia: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: dateTimeFormat(
                                                  "yyyy/MM/dd HH:mm",
                                                  containerUserInfoViewRow!
                                                      .createdAt!),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.domain_add,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Số toà nhà: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                containerUserInfoViewRow
                                                    .totalBuildings
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.add_home,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Số phòng đã đăng ký: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                containerUserInfoViewRow
                                                    .totalRooms
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.credit_card_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Số bài viết:  ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                containerUserInfoViewRow
                                                    .totalPosts
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.call_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Liên hệ: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: containerUserInfoViewRow
                                                  .phoneNumber!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Bài viết',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                if (false)
                                  FlutterFlowIconButton(
                                    borderRadius: 60.0,
                                    buttonSize: 40.0,
                                    fillColor: Colors.transparent,
                                    icon: Icon(
                                      Icons.filter_alt,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 0.0),
                        child: FutureBuilder<List<PostRoomViewRow>>(
                          future: PostRoomViewTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'building_owner_id',
                                  widget.id,
                                )
                                .order('post_created_at'),
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
                            List<PostRoomViewRow> listViewPostRoomViewRowList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                50.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewPostRoomViewRowList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 16.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewPostRoomViewRow =
                                    listViewPostRoomViewRowList[listViewIndex];
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
                                          listViewPostRoomViewRow,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.itemPostViewTenantModels
                                        .getModel(
                                      listViewPostRoomViewRow.postId!,
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ItemPostViewTenantWidget(
                                      key: Key(
                                        'Keyz7r_${listViewPostRoomViewRow.postId!}',
                                      ),
                                      postView: listViewPostRoomViewRow,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
