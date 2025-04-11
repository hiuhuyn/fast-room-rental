import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/landlord/components/item_room_root/item_room_root_widget.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'edit_post_model.dart';
export 'edit_post_model.dart';

class EditPostWidget extends StatefulWidget {
  const EditPostWidget({
    super.key,
    String? type,
    this.id,
    this.roomId,
    this.buildingId,
  }) : this.type = type ?? 'new';

  final String type;
  final String? id;
  final String? roomId;
  final String? buildingId;

  static String routeName = 'EditPost';
  static String routePath = '/editPost';

  @override
  State<EditPostWidget> createState() => _EditPostWidgetState();
}

class _EditPostWidgetState extends State<EditPostWidget> {
  late EditPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPostModel());

    _model.tfTitleFocusNode ??= FocusNode();

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
            'Bài viết',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.check,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
              onPressed: () async {
                if (_model.formKey.currentState == null ||
                    !_model.formKey.currentState!.validate()) {
                  return;
                }
                if (_model.ddBuildingValue == null) {
                  return;
                }
                if (_model.ddRoomValue == null) {
                  return;
                }
                if (widget.id != null && widget.id != '') {
                  await PostsTable().update(
                    data: {
                      'title': _model.tfTitleTextController.text,
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'id',
                      widget.id,
                    ),
                  );
                } else {
                  await PostsTable().insert({
                    'room_id': _model.ddRoomValue,
                    'title': _model.tfTitleTextController.text,
                  });
                }

                context.safePop();
              },
            ),
            Visibility(
              visible: widget.type == 'edit',
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                icon: Icon(
                  Icons.delete_outline,
                  color: FlutterFlowTheme.of(context).error,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<PostRoomViewRow>>(
            future: PostRoomViewTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'post_id',
                widget.id,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<PostRoomViewRow> containerPostRoomViewRowList =
                  snapshot.data!;

              final containerPostRoomViewRow =
                  containerPostRoomViewRowList.isNotEmpty
                      ? containerPostRoomViewRowList.first
                      : null;

              return Container(
                decoration: BoxDecoration(),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.tfTitleTextController ??=
                                TextEditingController(
                              text: widget.id != null && widget.id != ''
                                  ? containerPostRoomViewRow?.postTitle
                                  : '',
                            ),
                            focusNode: _model.tfTitleFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.tfTitleTextController',
                              Duration(milliseconds: 0),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Nhập tiêu đề bài viết',
                              hintStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            minLines: 6,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.tfTitleTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Toà nhà ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).error,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 0.0),
                          child: FutureBuilder<List<BuildingRow>>(
                            future: BuildingTable().queryRows(
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
                                      width: 16.0,
                                      height: 16.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<BuildingRow> ddBuildingBuildingRowList =
                                  snapshot.data!;

                              return FlutterFlowDropDown<String>(
                                controller: _model.ddBuildingValueController ??=
                                    FormFieldController<String>(
                                  _model.ddBuildingValue ??= () {
                                    if (widget.id != null &&
                                        widget.id != '') {
                                      return containerPostRoomViewRow
                                          ?.buildingId;
                                    } else if (widget.buildingId != null &&
                                        widget.buildingId != '') {
                                      return widget.buildingId;
                                    } else if (widget.buildingId == null ||
                                        widget.buildingId == '') {
                                      return null;
                                    } else {
                                      return ddBuildingBuildingRowList
                                          .firstOrNull?.id;
                                    }
                                  }(),
                                ),
                                options: List<String>.from(
                                    ddBuildingBuildingRowList
                                        .map((e) => e.id)
                                        .toList()),
                                optionLabels: ddBuildingBuildingRowList
                                    .map((e) => e.name)
                                    .withoutNulls
                                    .toList(),
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.ddBuildingValue = val);
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                },
                                width: double.infinity,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Chọn toà nhà...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                disabled: (widget.type == 'edit') ||
                                    (widget.roomId != null &&
                                        widget.roomId != ''),
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                        if (_model.ddBuildingValue != null &&
                            _model.ddBuildingValue != '')
                          FutureBuilder<List<RoomSummaryViewRow>>(
                            future: (_model.requestCompleter ??= Completer<
                                    List<RoomSummaryViewRow>>()
                                  ..complete(RoomSummaryViewTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'building_id',
                                          _model.ddBuildingValue,
                                        )
                                        .order('created_at'),
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
                              List<RoomSummaryViewRow>
                                  roomsRoomSummaryViewRowList = snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Phòng ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.ddRoomValueController ??=
                                                FormFieldController<String>(
                                          _model.ddRoomValue ??= () {
                                            if (widget.id != null &&
                                                widget.id != '') {
                                              return containerPostRoomViewRow
                                                  ?.roomId;
                                            } else if (widget.roomId != null &&
                                                widget.roomId != '') {
                                              return widget.roomId;
                                            } else if (_model.ddBuildingValue ==
                                                    null ||
                                                _model.ddBuildingValue == '') {
                                              return null;
                                            } else {
                                              return roomsRoomSummaryViewRowList
                                                  .firstOrNull?.roomId;
                                            }
                                          }(),
                                        ),
                                        options: List<String>.from(
                                            roomsRoomSummaryViewRowList
                                                .map((e) => e.roomId)
                                                .withoutNulls
                                                .toList()),
                                        optionLabels:
                                            roomsRoomSummaryViewRowList
                                                .map((e) => e.roomName)
                                                .withoutNulls
                                                .toList(),
                                        onChanged: (val) => safeSetState(
                                            () => _model.ddRoomValue = val),
                                        width: double.infinity,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Chọn phòng...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        disabled: (widget.type == 'edit') ||
                                            (widget.roomId != null &&
                                                widget.roomId != ''),
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    if ((_model.ddRoomValue != null &&
                                            _model.ddRoomValue != '') &&
                                        (roomsRoomSummaryViewRowList
                                            .where((e) =>
                                                e.roomId == _model.ddRoomValue)
                                            .toList()
                                            .isNotEmpty))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 24.0, 12.0, 12.0),
                                        child: wrapWithModel(
                                          model: _model.itemRoomRootModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRoomRootWidget(
                                            itemRoomSummaryView:
                                                roomsRoomSummaryViewRowList
                                                    .where((e) =>
                                                        e.roomId ==
                                                        _model.ddRoomValue)
                                                    .toList()
                                                    .firstOrNull!,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Yêu thích: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPostRoomViewRow?.favoriteCount
                                        ?.toString(),
                                    '0',
                                  ),
                                  style: TextStyle(),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Lượi xem: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPostRoomViewRow?.viewCount
                                        ?.toString(),
                                    '0',
                                  ),
                                  style: TextStyle(),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Lượi đặt lịch xem phòng: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPostRoomViewRow?.bookingCount
                                        ?.toString(),
                                    '0',
                                  ),
                                  style: TextStyle(),
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
                      ].divide(SizedBox(height: 8.0)),
                    ),
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
