import '/backend/supabase/supabase.dart';
import '/common/component/item_media_url/item_media_url_widget.dart';
import '/common/component/item_utility_and_furniture/item_utility_and_furniture_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'item_post_view_tenant_favorite_model.dart';
export 'item_post_view_tenant_favorite_model.dart';

class ItemPostViewTenantFavoriteWidget extends StatefulWidget {
  const ItemPostViewTenantFavoriteWidget({
    super.key,
    required this.postView,
  });

  final UserFavoritePostsRow? postView;

  @override
  State<ItemPostViewTenantFavoriteWidget> createState() =>
      _ItemPostViewTenantFavoriteWidgetState();
}

class _ItemPostViewTenantFavoriteWidgetState
    extends State<ItemPostViewTenantFavoriteWidget> {
  late ItemPostViewTenantFavoriteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemPostViewTenantFavoriteModel());

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
        minHeight: 180.0,
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
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.itemMediaUrlModel,
              updateCallback: () => safeSetState(() {}),
              child: ItemMediaUrlWidget(
                url: widget.postView?.roomImage,
                radius: 8,
                width: 150.0,
                hight: 200.0,
                onTap: (url, type) async {},
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.postView!.postTitle!,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.currency_exchange_rounded,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 18.0,
                          ),
                          Expanded(
                            child: Text(
                              'Từ ${valueOrDefault<String>(
                                widget.postView?.roomPrice?.toString(),
                                '0',
                              )}đ/tháng',
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
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.zoom_out_map_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  widget.postView?.roomHorizontal?.toString(),
                                  '0',
                                )} - ${valueOrDefault<String>(
                                  widget.postView?.roomVertical?.toString(),
                                  '0',
                                )}m2',
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
                              '${widget.postView?.cityName}, ${widget.postView?.districtName}, ${widget.postView?.wardName}, ${widget.postView?.buildingAddress}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: FutureBuilder<List<RoomFurnishingsViewRow>>(
                          future: RoomFurnishingsViewTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'room_id',
                              widget.postView?.roomId,
                            ),
                            limit: 2,
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
                            List<RoomFurnishingsViewRow>
                                wrapRoomFurnishingsViewRowList = snapshot.data!;

                            return Wrap(
                              spacing: 10.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(
                                  wrapRoomFurnishingsViewRowList.length,
                                  (wrapIndex) {
                                final wrapRoomFurnishingsViewRow =
                                    wrapRoomFurnishingsViewRowList[wrapIndex];
                                return ItemUtilityAndFurnitureWidget(
                                  key: Key(
                                      'Keyvfr_${wrapIndex}_of_${wrapRoomFurnishingsViewRowList.length}'),
                                  isShowDeleted: false,
                                  url: wrapRoomFurnishingsViewRow
                                      .furnishingImage,
                                  name: wrapRoomFurnishingsViewRow
                                      .furnishingName!,
                                  onDeleted: () async {},
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
