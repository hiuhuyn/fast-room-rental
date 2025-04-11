import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_notificaiton/item_notificaiton_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'notification_landlord_model.dart';
export 'notification_landlord_model.dart';

class NotificationLandlordWidget extends StatefulWidget {
  const NotificationLandlordWidget({super.key});

  static String routeName = 'NotificationLandlord';
  static String routePath = '/notificationLandlord';

  @override
  State<NotificationLandlordWidget> createState() =>
      _NotificationLandlordWidgetState();
}

class _NotificationLandlordWidgetState
    extends State<NotificationLandlordWidget> {
  late NotificationLandlordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationLandlordModel());

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
            'Thông báo',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
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
                child: StreamBuilder<List<NotificationsRow>>(
                  stream: _model.listViewSupabaseStream ??= SupaFlow.client
                      .from("notifications")
                      .stream(primaryKey: ['id'])
                      .eqOrNull(
                        'user_id',
                        currentUserUid,
                      )
                      .order('created_at')
                      .map((list) =>
                          list.map((item) => NotificationsRow(item)).toList()),
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
                        24.0,
                        0,
                        40.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRowList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.0),
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
                              'Key0xq_${listViewNotificationsRow.id}',
                            ),
                            noti: listViewNotificationsRow,
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
