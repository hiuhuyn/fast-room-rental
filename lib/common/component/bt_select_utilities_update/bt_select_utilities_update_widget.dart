import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'bt_select_utilities_update_model.dart';
export 'bt_select_utilities_update_model.dart';

/// Tiện ích cập nhậtr
class BtSelectUtilitiesUpdateWidget extends StatefulWidget {
  const BtSelectUtilitiesUpdateWidget({
    super.key,
    this.onSubmit,
    this.valus,
    required this.roomId,
  });

  final Future Function()? onSubmit;
  final List<int>? valus;
  final String? roomId;

  @override
  State<BtSelectUtilitiesUpdateWidget> createState() =>
      _BtSelectUtilitiesUpdateWidgetState();
}

class _BtSelectUtilitiesUpdateWidgetState
    extends State<BtSelectUtilitiesUpdateWidget> {
  late BtSelectUtilitiesUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BtSelectUtilitiesUpdateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cpSelects = widget.valus!.toList().cast<int>();
      safeSetState(() {});
    });

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
      constraints: BoxConstraints(
        maxHeight: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryText,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Text(
              'Tiện ích phòng',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Flexible(
              child: FutureBuilder<List<UtilitiesRow>>(
                future: FFAppState().utilitiesQuery(
                  requestFn: () => UtilitiesTable().queryRows(
                    queryFn: (q) => q,
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
                  List<UtilitiesRow> listViewUtilitiesRowList = snapshot.data!;

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      4.0,
                      0,
                      8.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUtilitiesRowList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 4.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewUtilitiesRow =
                          listViewUtilitiesRowList[listViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.cpSelects
                              .where((e) => e == listViewUtilitiesRow.id)
                              .toList()
                              .isNotEmpty) {
                            _model.removeFromCpSelects(listViewUtilitiesRow.id);
                            safeSetState(() {});
                          } else {
                            _model.addToCpSelects(listViewUtilitiesRow.id);
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _model.cpSelects
                                    .where((e) => e == listViewUtilitiesRow.id)
                                    .toList()
                                    .isNotEmpty
                                ? FlutterFlowTheme.of(context).hover
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      if (listViewUtilitiesRow.image != null &&
                                          listViewUtilitiesRow.image != '') {
                                        return Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            listViewUtilitiesRow.image!,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else {
                                        return Icon(
                                          Icons.auto_mode,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewUtilitiesRow.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                _model.index = 0;
                safeSetState(() {});
                while (_model.index < _model.cpSelects.length) {
                  if (!(widget.valus!
                      .where((e) =>
                          e == _model.cpSelects.elementAtOrNull(_model.index))
                      .toList()
                      .isNotEmpty)) {
                    await RoomUtilitiesTable().insert({
                      'room_id': widget.roomId,
                      'utility_id':
                          _model.cpSelects.elementAtOrNull(_model.index),
                    });
                  }
                  _model.index = _model.index + 1;
                }
                _model.index = 0;
                safeSetState(() {});
                while (_model.index < widget.valus!.length) {
                  if (!(_model.cpSelects
                      .where((e) =>
                          (widget.valus?.elementAtOrNull(_model.index)) == e)
                      .toList()
                      .isNotEmpty)) {
                    await RoomUtilitiesTable().delete(
                      matchingRows: (rows) => rows
                          .eqOrNull(
                            'room_id',
                            widget.roomId,
                          )
                          .eqOrNull(
                            'utility_id',
                            widget.valus?.elementAtOrNull(_model.index),
                          ),
                    );
                  }
                  _model.index = _model.index + 1;
                }
                await widget.onSubmit?.call();
                Navigator.pop(context);
              },
              text: 'Lưu',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).tertiary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ].divide(SizedBox(height: 24.0)).addToEnd(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
