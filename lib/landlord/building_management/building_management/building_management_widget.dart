import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_building_summary_view/item_building_summary_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'building_management_model.dart';
export 'building_management_model.dart';

class BuildingManagementWidget extends StatefulWidget {
  const BuildingManagementWidget({super.key});

  static String routeName = 'BuildingManagement';
  static String routePath = '/buildingManagement';

  @override
  State<BuildingManagementWidget> createState() =>
      _BuildingManagementWidgetState();
}

class _BuildingManagementWidgetState extends State<BuildingManagementWidget> {
  late BuildingManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingManagementModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              EditBuildingWidget.routeName,
              queryParameters: {
                'type': serializeParam(
                  'new',
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
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
            'Quản lý toà nhà',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: FutureBuilder<List<BuildingSummaryViewRow>>(
                    future: BuildingSummaryViewTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'user_id',
                            currentUserUid,
                          )
                          .order('created_at'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      List<BuildingSummaryViewRow>
                          listViewBuildingSummaryViewRowList = snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          24.0,
                          0,
                          100.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewBuildingSummaryViewRowList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewBuildingSummaryViewRow =
                              listViewBuildingSummaryViewRowList[listViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                EditBuildingWidget.routeName,
                                queryParameters: {
                                  'type': serializeParam(
                                    'edit',
                                    ParamType.String,
                                  ),
                                  'id': serializeParam(
                                    listViewBuildingSummaryViewRow.id,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: wrapWithModel(
                              model:
                                  _model.itemBuildingSummaryViewModels.getModel(
                                listViewBuildingSummaryViewRow.id!,
                                listViewIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: ItemBuildingSummaryViewWidget(
                                key: Key(
                                  'Keyuaq_${listViewBuildingSummaryViewRow.id!}',
                                ),
                                value: listViewBuildingSummaryViewRow,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
