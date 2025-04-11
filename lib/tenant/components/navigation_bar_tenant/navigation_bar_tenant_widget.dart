import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'navigation_bar_tenant_model.dart';
export 'navigation_bar_tenant_model.dart';

class NavigationBarTenantWidget extends StatefulWidget {
  const NavigationBarTenantWidget({
    super.key,
    required this.page,
  });

  final PageTagNavigationBar? page;

  @override
  State<NavigationBarTenantWidget> createState() =>
      _NavigationBarTenantWidgetState();
}

class _NavigationBarTenantWidgetState extends State<NavigationBarTenantWidget> {
  late NavigationBarTenantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarTenantModel());

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
      width: double.infinity,
      height: 65.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(
                  HomeTenantWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                    ),
                  },
                );
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.home_outlined,
                  color: widget.page == PageTagNavigationBar.home
                      ? FlutterFlowTheme.of(context).tertiary
                      : FlutterFlowTheme.of(context).cBorder,
                  size: 40.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          ChatTenantWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_sharp,
                              color: widget.page == PageTagNavigationBar.chat
                                  ? FlutterFlowTheme.of(context).tertiary
                                  : FlutterFlowTheme.of(context).cBorder,
                              size: 40.0,
                            ),
                            StreamBuilder<List<NotificationsRow>>(
                              stream: _model.containerSupabaseStream1 ??=
                                  SupaFlow.client
                                      .from("notifications")
                                      .stream(primaryKey: ['id'])
                                      .eqOrNull(
                                        'is_read',
                                        false,
                                      )
                                      .map((list) => list
                                          .map((item) => NotificationsRow(item))
                                          .toList()),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Container(
                                    width: 0.0,
                                    height: 0.0,
                                    child: EmptyWidget(),
                                  );
                                }
                                List<NotificationsRow>
                                    containerNotificationsRowList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: containerNotificationsRowList
                                            .where((e) =>
                                                e.targetType ==
                                                TypeNoti.message.name)
                                            .toList()
                                            .length >
                                        0,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          36.0, 0.0, 0.0, 10.0),
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            (int count) {
                                              return count > 100
                                                  ? '99+'
                                                  : count.toString();
                                            }(containerNotificationsRowList
                                                .where((e) =>
                                                    (e.targetType ==
                                                        TypeNoti
                                                            .message.name) &&
                                                    !e.isRead!)
                                                .toList()
                                                .length),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white,
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          NotificationTenantWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 70.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: widget.page ==
                                          PageTagNavigationBar.notification
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : FlutterFlowTheme.of(context).cBorder,
                                  size: 40.0,
                                ),
                              ),
                              StreamBuilder<List<NotificationsRow>>(
                                stream: _model.containerSupabaseStream2 ??=
                                    SupaFlow.client
                                        .from("notifications")
                                        .stream(primaryKey: ['id'])
                                        .eqOrNull(
                                          'is_read',
                                          false,
                                        )
                                        .map((list) => list
                                            .map((item) =>
                                                NotificationsRow(item))
                                            .toList()),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Container(
                                      width: 0.0,
                                      height: 0.0,
                                      child: EmptyWidget(),
                                    );
                                  }
                                  List<NotificationsRow>
                                      containerNotificationsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible:
                                          containerNotificationsRowList.length >
                                              0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            36.0, 0.0, 0.0, 10.0),
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Text(
                                              (int count) {
                                                return count > 100
                                                    ? '99+'
                                                    : count.toString();
                                              }(containerNotificationsRowList
                                                  .where((e) => !e.isRead!)
                                                  .toList()
                                                  .length),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<UserInfoViewRow>>(
              future: FFAppState().userInfor(
                requestFn: () => UserInfoViewTable().querySingleRow(
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
                      width: 20.0,
                      height: 20.0,
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

                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      ProfileTenantWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (containerUserInfoViewRow?.avtFileName == null ||
                            containerUserInfoViewRow?.avtFileName == '') {
                          return Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/default_icon.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: OctoImage(
                              placeholderBuilder: (_) => SizedBox.expand(
                                child: Image(
                                  image: BlurHashImage(
                                      containerUserInfoViewRow.avtBlurHash!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              image: NetworkImage(
                                containerUserInfoViewRow!.avtFileName!,
                              ),
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
