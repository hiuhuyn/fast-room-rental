import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant_favorite/item_post_view_tenant_favorite_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'favourite_posts_model.dart';
export 'favourite_posts_model.dart';

class FavouritePostsWidget extends StatefulWidget {
  const FavouritePostsWidget({super.key});

  static String routeName = 'FavouritePosts';
  static String routePath = '/favouritePosts';

  @override
  State<FavouritePostsWidget> createState() => _FavouritePostsWidgetState();
}

class _FavouritePostsWidgetState extends State<FavouritePostsWidget> {
  late FavouritePostsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouritePostsModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Danh sách yêu thích',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<List<UserFavoritePostsRow>>(
                  future: UserFavoritePostsTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'user_favorite_id',
                          currentUserUid,
                        )
                        .order('user_favorite_at'),
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
                    List<UserFavoritePostsRow>
                        listViewUserFavoritePostsRowList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        12.0,
                        0,
                        50.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUserFavoritePostsRowList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewUserFavoritePostsRow =
                            listViewUserFavoritePostsRowList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.qrPost =
                                  await PostRoomViewTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'post_id',
                                  listViewUserFavoritePostsRow.postId,
                                ),
                              );

                              context.pushNamed(
                                RoomDetailsPageWidget.routeName,
                                queryParameters: {
                                  'post': serializeParam(
                                    _model.qrPost?.firstOrNull,
                                    ParamType.SupabaseRow,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );

                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.itemPostViewTenantFavoriteModels
                                  .getModel(
                                listViewUserFavoritePostsRow.postId!,
                                listViewIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: ItemPostViewTenantFavoriteWidget(
                                key: Key(
                                  'Keypox_${listViewUserFavoritePostsRow.postId!}',
                                ),
                                postView: listViewUserFavoritePostsRow,
                              ),
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
      ),
    );
  }
}
