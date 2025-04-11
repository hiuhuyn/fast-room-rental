import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/item_appointments_tenant/item_appointments_tenant_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'viewing_appointments_tenant_model.dart';
export 'viewing_appointments_tenant_model.dart';

class ViewingAppointmentsTenantWidget extends StatefulWidget {
  const ViewingAppointmentsTenantWidget({super.key});

  static String routeName = 'ViewingAppointmentsTenant';
  static String routePath = '/viewingAppointmentsTenant';

  @override
  State<ViewingAppointmentsTenantWidget> createState() =>
      _ViewingAppointmentsTenantWidgetState();
}

class _ViewingAppointmentsTenantWidgetState
    extends State<ViewingAppointmentsTenantWidget>
    with TickerProviderStateMixin {
  late ViewingAppointmentsTenantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewingAppointmentsTenantModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Quản lý lịch hẹn',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
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
                child: FutureBuilder<List<BookingsViewRow>>(
                  future: (_model.requestCompleter ??=
                          Completer<List<BookingsViewRow>>()
                            ..complete(BookingsViewTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  )
                                  .order('appointment_time'),
                            )))
                      .future,
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
                    List<BookingsViewRow> tabBarBookingsViewRowList =
                        snapshot.data!;

                    return Column(
                      children: [
                        Align(
                          alignment: Alignment(-1.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: FlutterFlowTheme.of(context).tertiary,
                            unselectedLabelColor: Color(0xDE8B8585),
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).tertiary,
                            tabs: [
                              Tab(
                                text: 'Chờ xác nhận',
                              ),
                              Tab(
                                text: 'Chưa xem phòng',
                              ),
                              Tab(
                                text: 'Đã xem phòng',
                              ),
                              Tab(
                                text: 'Quá hạn',
                              ),
                              Tab(
                                text: 'Đã huỷ',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {},
                                () async {},
                                () async {},
                                () async {},
                                () async {}
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final pendings =
                                            tabBarBookingsViewRowList
                                                .where((e) =>
                                                    e.status ==
                                                    BookingsStatusCheck
                                                        .pending.name)
                                                .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: pendings.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, pendingsIndex) {
                                            final pendingsItem =
                                                pendings[pendingsIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .itemAppointmentsTenantModels1
                                                  .getModel(
                                                pendingsItem.id!,
                                                pendingsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ItemAppointmentsTenantWidget(
                                                key: Key(
                                                  'Key6jk_${pendingsItem.id!}',
                                                ),
                                                booking: pendingsItem,
                                                onUpdated: () async {
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final confirmeds =
                                            tabBarBookingsViewRowList
                                                .where((e) =>
                                                    e.status ==
                                                    BookingsStatusCheck
                                                        .confirmed.name)
                                                .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: confirmeds.length,
                                          itemBuilder:
                                              (context, confirmedsIndex) {
                                            final confirmedsItem =
                                                confirmeds[confirmedsIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .itemAppointmentsTenantModels2
                                                  .getModel(
                                                confirmedsItem.id!,
                                                confirmedsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ItemAppointmentsTenantWidget(
                                                key: Key(
                                                  'Keyizs_${confirmedsItem.id!}',
                                                ),
                                                booking: confirmedsItem,
                                                onUpdated: () async {
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final vieweds =
                                            tabBarBookingsViewRowList
                                                .where((e) =>
                                                    e.status ==
                                                    BookingsStatusCheck
                                                        .viewed.name)
                                                .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: vieweds.length,
                                          itemBuilder: (context, viewedsIndex) {
                                            final viewedsItem =
                                                vieweds[viewedsIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .itemAppointmentsTenantModels3
                                                  .getModel(
                                                viewedsItem.id!,
                                                viewedsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ItemAppointmentsTenantWidget(
                                                key: Key(
                                                  'Keyimu_${viewedsItem.id!}',
                                                ),
                                                booking: viewedsItem,
                                                onUpdated: () async {
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final expireds =
                                            tabBarBookingsViewRowList
                                                .where((e) =>
                                                    e.status ==
                                                    BookingsStatusCheck
                                                        .expired.name)
                                                .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: expireds.length,
                                          itemBuilder:
                                              (context, expiredsIndex) {
                                            final expiredsItem =
                                                expireds[expiredsIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .itemAppointmentsTenantModels4
                                                  .getModel(
                                                expiredsItem.id!,
                                                expiredsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ItemAppointmentsTenantWidget(
                                                key: Key(
                                                  'Keyjwg_${expiredsItem.id!}',
                                                ),
                                                booking: expiredsItem,
                                                onUpdated: () async {
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final cancelleds =
                                            tabBarBookingsViewRowList
                                                .where((e) =>
                                                    e.status ==
                                                    BookingsStatusCheck
                                                        .cancelled.name)
                                                .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: cancelleds.length,
                                          itemBuilder:
                                              (context, cancelledsIndex) {
                                            final cancelledsItem =
                                                cancelleds[cancelledsIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .itemAppointmentsTenantModels5
                                                  .getModel(
                                                cancelledsItem.id!,
                                                cancelledsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ItemAppointmentsTenantWidget(
                                                key: Key(
                                                  'Keyuxj_${cancelledsItem.id!}',
                                                ),
                                                booking: cancelledsItem,
                                                onUpdated: () async {
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
