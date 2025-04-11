import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_post_view_tenant/item_post_view_tenant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'cb_my_posts_model.dart';
export 'cb_my_posts_model.dart';

class CbMyPostsWidget extends StatefulWidget {
  const CbMyPostsWidget({super.key});

  @override
  State<CbMyPostsWidget> createState() => _CbMyPostsWidgetState();
}

class _CbMyPostsWidgetState extends State<CbMyPostsWidget> {
  late CbMyPostsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CbMyPostsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).cBorder,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              Text(
                'Danh sách bài đăng của bản thân',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Flexible(
                child: FutureBuilder<List<PostRoomViewRow>>(
                  future: PostRoomViewTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'building_owner_id',
                          currentUserUid,
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

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPostRoomViewRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPostRoomViewRow =
                            listViewPostRoomViewRowList[listViewIndex];
                        return Opacity(
                          opacity: listViewPostRoomViewRow.postId ==
                                  _model.postSelect?.postId
                              ? 0.7
                              : 1.0,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (listViewPostRoomViewRow.postId ==
                                  _model.postSelect?.postId) {
                                _model.postSelect = null;
                                safeSetState(() {});
                              } else {
                                _model.postSelect = listViewPostRoomViewRow;
                                safeSetState(() {});
                              }
                            },
                            child: wrapWithModel(
                              model: _model.itemPostViewTenantModels.getModel(
                                listViewPostRoomViewRow.postId!,
                                listViewIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: ItemPostViewTenantWidget(
                                key: Key(
                                  'Keyuwx_${listViewPostRoomViewRow.postId!}',
                                ),
                                postView: listViewPostRoomViewRow,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Huỷ bỏ',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xB3B2B2B2),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: (_model.postSelect == null)
                          ? null
                          : () async {
                              Navigator.pop(context, _model.postSelect);
                            },
                      text: 'Chọn',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(4.0),
                        disabledColor: Color(0xB3B2B2B2),
                        disabledTextColor: Colors.white,
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
