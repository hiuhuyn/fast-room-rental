import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/dialog_cancel_appointment/dialog_cancel_appointment_widget.dart';
import '/common/component/item_media_url/item_media_url_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'item_appointments_landlord_model.dart';
export 'item_appointments_landlord_model.dart';

class ItemAppointmentsLandlordWidget extends StatefulWidget {
  const ItemAppointmentsLandlordWidget({
    super.key,
    required this.booking,
    this.onUpdated,
  });

  final BookingsViewRow? booking;
  final Future Function()? onUpdated;

  @override
  State<ItemAppointmentsLandlordWidget> createState() =>
      _ItemAppointmentsLandlordWidgetState();
}

class _ItemAppointmentsLandlordWidgetState
    extends State<ItemAppointmentsLandlordWidget> {
  late ItemAppointmentsLandlordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemAppointmentsLandlordModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: FlutterFlowTheme.of(context).shadow,
            offset: Offset(
              0.0,
              0.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Text(
                dateTimeFormat("d/M h:mm a", widget.booking!.createdAt!),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.itemMediaUrlModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ItemMediaUrlWidget(
                    url: widget.booking?.roomImageUrl,
                    radius: 8,
                    width: 100.0,
                    hight: 130.0,
                    onTap: (url, type) async {},
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hẹn: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: dateTimeFormat("EEEE MM/dd HH:mm",
                                  widget.booking!.appointmentTime!),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tên bài đăng: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: widget.booking!.postTitle!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  _model.qrPostView =
                                      await PostRoomViewTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'post_id',
                                      widget.booking?.postId,
                                    ),
                                  );
                                  if (_model.qrPostView != null &&
                                      (_model.qrPostView)!.isNotEmpty) {
                                    context.pushNamed(
                                      EditPostWidget.routeName,
                                      queryParameters: {
                                        'type': serializeParam(
                                          'edit',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }

                                  safeSetState(() {});
                                },
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.qrChat = await ChatOverviewTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'my_user',
                                  currentUserUid,
                                )
                                .eqOrNull(
                                  'other_user',
                                  widget.booking?.userId,
                                ),
                          );
                          if (_model.qrChat != null &&
                              (_model.qrChat)!.isNotEmpty) {
                            context.pushNamed(
                              ChatMessagesWidget.routeName,
                              queryParameters: {
                                'chatId': serializeParam(
                                  _model.qrChat?.firstOrNull?.id,
                                  ParamType.String,
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
                          } else {
                            _model.insertChat = await ChatsTable().insert({
                              'my_user': currentUserUid,
                              'other_user': widget.booking?.userId,
                            });

                            context.pushNamed(
                              ChatMessagesWidget.routeName,
                              queryParameters: {
                                'chatId': serializeParam(
                                  _model.insertChat?.id,
                                  ParamType.String,
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
                          }

                          safeSetState(() {});
                        },
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Khách: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: widget.booking!.tenantName!,
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).primary,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
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
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Trạng thái: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: widget.booking!.status!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontStyle: FontStyle.normal,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            if (widget.booking?.status == BookingsStatusCheck.confirmed.name)
              FFButtonWidget(
                onPressed: () async {
                  await BookingsTable().update(
                    data: {
                      'status': BookingsStatusCheck.viewed.name,
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'id',
                      widget.booking?.id,
                    ),
                  );
                  await widget.onUpdated?.call();
                },
                text: 'Xác nhận khách đã xem phòng',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            if (widget.booking?.status == BookingsStatusCheck.pending.name)
              FFButtonWidget(
                onPressed: () async {
                  await BookingsTable().update(
                    data: {
                      'status': BookingsStatusCheck.confirmed.name,
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'id',
                      widget.booking?.id,
                    ),
                  );
                  await widget.onUpdated?.call();
                },
                text: 'Xác nhận lịch hẹn',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            if ((widget.booking?.status == BookingsStatusCheck.pending.name) ||
                (widget.booking?.status == BookingsStatusCheck.confirmed.name))
              Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: DialogCancelAppointmentWidget(
                            bookingId: widget.booking!.id!,
                            onUpload: () async {
                              await widget.onUpdated?.call();
                            },
                          ),
                        );
                      },
                    );
                  },
                  text: 'Huỷ lịch hẹn',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).error,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            if ((widget.booking?.reasonForCancel != null &&
                    widget.booking?.reasonForCancel != '') &&
                (widget.booking?.status == BookingsStatusCheck.cancelled.name))
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  widget.booking!.reasonForCancel!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
