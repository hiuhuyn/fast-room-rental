import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/dialog_cancel_appointment/dialog_cancel_appointment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'item_appointments_tenant_model.dart';
export 'item_appointments_tenant_model.dart';

class ItemAppointmentsTenantWidget extends StatefulWidget {
  const ItemAppointmentsTenantWidget({
    super.key,
    required this.booking,
    this.onUpdated,
  });

  final BookingsViewRow? booking;
  final Future Function()? onUpdated;

  @override
  State<ItemAppointmentsTenantWidget> createState() =>
      _ItemAppointmentsTenantWidgetState();
}

class _ItemAppointmentsTenantWidgetState
    extends State<ItemAppointmentsTenantWidget> {
  late ItemAppointmentsTenantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemAppointmentsTenantModel());

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
                Builder(
                  builder: (context) {
                    if (widget.booking?.roomImageUrl != null &&
                        widget.booking?.roomImageUrl != '') {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.booking!.roomImageUrl!,
                          width: 100.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/20230626211615-3a61_wm.jpg',
                          width: 100.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                  },
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
                                      RoomDetailsPageWidget.routeName,
                                      queryParameters: {
                                        'post': serializeParam(
                                          _model.qrPostView?.firstOrNull,
                                          ParamType.SupabaseRow,
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
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Địa chỉ: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  '${widget.booking?.cityName}, ${widget.booking?.districtName}, ${widget.booking?.wardName}, ${widget.booking?.buildingAddress}',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
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
                              text: 'Chủ nhà: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: widget.booking!.landlordName!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  context.pushNamed(
                                    LandlordInformationWidget.routeName,
                                    queryParameters: {
                                      'id': serializeParam(
                                        widget.booking?.landlordId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
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
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'SDT: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: widget.booking!.landlordPhone!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: widget.booking!.landlordPhone!));
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: widget.booking!.landlordPhone!,
                                  ));
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
