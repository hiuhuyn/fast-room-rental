import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'c_item_room_model.dart';
export 'c_item_room_model.dart';

class CItemRoomWidget extends StatefulWidget {
  const CItemRoomWidget({
    super.key,
    required this.room,
  });

  final RoomSearchStruct? room;

  @override
  State<CItemRoomWidget> createState() => _CItemRoomWidgetState();
}

class _CItemRoomWidgetState extends State<CItemRoomWidget> {
  late CItemRoomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CItemRoomModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: AlignmentDirectional(1.0, -1.0),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(7.0),
                  topRight: Radius.circular(8.0),
                ),
                child: OctoImage(
                  placeholderBuilder: (_) => SizedBox.expand(
                    child: Image(
                      image: BlurHashImage(widget.room!.roomImageBlurHash),
                      fit: BoxFit.cover,
                    ),
                  ),
                  image: NetworkImage(
                    valueOrDefault<String>(
                      widget.room?.roomImage,
                      'https://images.unsplash.com/photo-1513694203232-719a280e022f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxyb29tfGVufDB8fHx8MTc0MjU0MTk0M3ww&ixlib=rb-4.0.3&q=80&w=1080',
                    ),
                  ),
                  width: double.infinity,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    getJsonField(
                      FFAppState()
                          .roomStatusMap
                          .where((e) =>
                              widget.room?.roomStatus ==
                              getJsonField(
                                e,
                                r'''$.key''',
                              ).toString())
                          .toList()
                          .firstOrNull,
                      r'''$.value''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.room?.roomStatus ==
                                  RoomStatus.available.name) {
                                return FlutterFlowTheme.of(context).tertiary;
                              } else if (widget.room?.roomStatus ==
                                  RoomStatus.booked.name) {
                                return FlutterFlowTheme.of(context).primary;
                              } else if (widget.room?.roomStatus ==
                                  RoomStatus.occupied.name) {
                                return FlutterFlowTheme.of(context).success;
                              } else {
                                return FlutterFlowTheme.of(context).error;
                              }
                            }(),
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  functions.timeAgo(functions
                      .convertStringToDate(widget.room?.postCreatedAt)!),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).tertiary,
                        letterSpacing: 0.0,
                      ),
                ),
                if (widget.room?.postTitle != null &&
                    widget.room?.postTitle != '')
                  Text(
                    widget.room!.postTitle,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Color(0xFFFF0000),
                      size: 18.0,
                    ),
                    Text(
                      'Từ ${valueOrDefault<String>(
                        formatNumber(
                          widget.room?.roomPrice,
                          formatType: FormatType.custom,
                          format: '#,###',
                          locale: '',
                        ),
                        '0',
                      )}đ/tháng',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFFF0000),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 6.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.open_with,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18.0,
                        ),
                        Text(
                          '${valueOrDefault<String>(
                            widget.room?.roomHorizontal.toString(),
                            '0',
                          )} - ${valueOrDefault<String>(
                            widget.room?.roomVertical.toString(),
                            '0',
                          )}m2',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(width: 6.0)),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 18.0,
                    ),
                    Expanded(
                      child: Text(
                        '${widget.room?.cityName}, ${widget.room?.districtName}, ${widget.room?.wardName}, ${widget.room?.buildingAddress}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 6.0)),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ],
      ),
    );
  }
}
