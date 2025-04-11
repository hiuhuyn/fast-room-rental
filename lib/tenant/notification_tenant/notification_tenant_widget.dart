import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_notificaiton/item_notificaiton_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/navigation_bar_tenant/navigation_bar_tenant_widget.dart';
import 'package:flutter/material.dart';
import 'notification_tenant_model.dart';
export 'notification_tenant_model.dart';

class NotificationTenantWidget extends StatefulWidget {
  const NotificationTenantWidget({super.key});

  static String routeName = 'NotificationTenant';
  static String routePath = '/notificationTenant';

  @override
  State<NotificationTenantWidget> createState() =>
      _NotificationTenantWidgetState();
}

class _NotificationTenantWidgetState extends State<NotificationTenantWidget> {
  late NotificationTenantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationTenantModel());

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
          title: Text(
            'Thông báo',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF15161E),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<NotificationsRow>>(
                    stream: _model.listViewSupabaseStream ??= SupaFlow.client
                        .from("notifications")
                        .stream(primaryKey: ['id'])
                        .eqOrNull(
                          'user_id',
                          currentUserUid,
                        )
                        .order('created_at')
                        .map((list) => list
                            .map((item) => NotificationsRow(item))
                            .toList()),
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
                      List<NotificationsRow> listViewNotificationsRowList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          4.0,
                          0,
                          44.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNotificationsRowList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewNotificationsRow =
                              listViewNotificationsRowList[listViewIndex];
                          return wrapWithModel(
                            model: _model.itemNotificaitonModels.getModel(
                              listViewNotificationsRow.id,
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ItemNotificaitonWidget(
                              key: Key(
                                'Keych5_${listViewNotificationsRow.id}',
                              ),
                              noti: listViewNotificationsRow,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navigationBarTenantModel,
                updateCallback: () => safeSetState(() {}),
                child: NavigationBarTenantWidget(
                  page: PageTagNavigationBar.notification,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
