import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_media_url/item_media_url_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_room_root_model.dart';
export 'item_room_root_model.dart';

class ItemRoomRootWidget extends StatefulWidget {
  const ItemRoomRootWidget({
    super.key,
    required this.itemRoomSummaryView,
  });

  final RoomSummaryViewRow? itemRoomSummaryView;

  @override
  State<ItemRoomRootWidget> createState() => _ItemRoomRootWidgetState();
}

class _ItemRoomRootWidgetState extends State<ItemRoomRootWidget> {
  late ItemRoomRootModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemRoomRootModel());

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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    widget.itemRoomSummaryView!.roomName!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    getJsonField(
                      FFAppState()
                          .roomStatusMap
                          .where((e) =>
                              widget.itemRoomSummaryView?.roomStatus ==
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
                          color: () {
                            if (widget.itemRoomSummaryView?.roomStatus ==
                                RoomStatus.available.name) {
                              return FlutterFlowTheme.of(context).tertiary;
                            } else if (widget
                                    .itemRoomSummaryView?.roomStatus ==
                                RoomStatus.booked.name) {
                              return FlutterFlowTheme.of(context).primary;
                            } else if (widget
                                    .itemRoomSummaryView?.roomStatus ==
                                RoomStatus.occupied.name) {
                              return FlutterFlowTheme.of(context).success;
                            } else {
                              return FlutterFlowTheme.of(context).error;
                            }
                          }(),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                FutureBuilder<List<MediaRoomViewRow>>(
                  future: MediaRoomViewTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'room_id',
                      widget.itemRoomSummaryView?.roomId,
                    ),
                    limit: 4,
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
                    List<MediaRoomViewRow> gridViewMediaRoomViewRowList =
                        snapshot.data!;

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        childAspectRatio: 1.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: gridViewMediaRoomViewRowList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewMediaRoomViewRow =
                            gridViewMediaRoomViewRowList[gridViewIndex];
                        return ItemMediaUrlWidget(
                          key: Key(
                              'Keyi9m_${gridViewIndex}_of_${gridViewMediaRoomViewRowList.length}'),
                          url: gridViewMediaRoomViewRow.fileName,
                          radius: 8,
                          width: 100.0,
                          hight: 100.0,
                          onTap: (url, type) async {},
                        );
                      },
                    );
                  },
                ),
                Container(
                  width: double.infinity,
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
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 18.0,
                            ),
                            Expanded(
                              child: Text(
                                '${widget.itemRoomSummaryView?.roomPrice?.toString()}đ/tháng',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.zoom_out_map_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                            Text(
                              '${widget.itemRoomSummaryView?.roomHorizontal?.toString()} - ${widget.itemRoomSummaryView?.roomVertical?.toString()}m2',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.itemRoomSummaryView?.totalFavorites
                                  ?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.itemRoomSummaryView?.totalViews
                                  ?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.send_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.itemRoomSummaryView?.totalBookings
                                  ?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.polyline,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.itemRoomSummaryView?.totalPosts
                                  ?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
