import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/c_item_room/c_item_room_widget.dart';
import '/common/component/cb_filter_search_rooms/cb_filter_search_rooms_widget.dart';
import '/common/component/cb_price_range_rooms/cb_price_range_rooms_widget.dart';
import '/common/component/cb_sort_rooms/cb_sort_rooms_widget.dart';
import '/common/component/cd_select_city/cd_select_city_widget.dart';
import '/common/component/empty/empty_widget.dart';
import '/common/component/empty_text/empty_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'search_room_model.dart';
export 'search_room_model.dart';

class SearchRoomWidget extends StatefulWidget {
  const SearchRoomWidget({
    super.key,
    this.cityId,
    this.roomTypeId,
  });

  final int? cityId;
  final int? roomTypeId;

  static String routeName = 'SearchRoom';
  static String routePath = '/searchRoom';

  @override
  State<SearchRoomWidget> createState() => _SearchRoomWidgetState();
}

class _SearchRoomWidgetState extends State<SearchRoomWidget> {
  late SearchRoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchRoomModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (widget.cityId != null) {
            _model.qrCity = await CitiesTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'code',
                widget.cityId,
              ),
            );
            if (_model.qrCity != null && (_model.qrCity)!.isNotEmpty) {
              _model.city = _model.qrCity?.firstOrNull;
              safeSetState(() {});
            }
          }
        }),
        Future(() async {
          if (widget.roomTypeId != null) {
            _model.qrRT = await RoomTypesTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.roomTypeId,
              ),
            );
            if (_model.qrRT != null && (_model.qrRT)!.isNotEmpty) {
              _model.roomTypes = _model.qrRT!.toList().cast<RoomTypesRow>();
            }
          }
        }),
      ]);

      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 200));
      safeSetState(() => _model.staggeredViewPagingController?.refresh());
      await _model.waitForOnePageForStaggeredView();
    });

    _model.tfSeachTextController ??= TextEditingController();
    _model.tfSeachFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          children: [
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.tfSeachTextController,
                                focusNode: _model.tfSeachFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.tfSeachTextController',
                                  Duration(milliseconds: 200),
                                  () async {
                                    safeSetState(() => _model
                                        .staggeredViewPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForStaggeredView();
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Nhập tiêu đề tin đăng',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          50.0, 20.0, 20.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.tfSeachTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.search_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CbSortRoomsWidget(
                                    sort: _model.sort,
                                    onSubmit: (sort) async {
                                      _model.sort = sort;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                      safeSetState(() => _model
                                          .staggeredViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForStaggeredView();
                                    },
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Sắp xếp theo',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CbPriceRangeRoomsWidget(
                                    minPrice: _model.minPrice,
                                    maxPrice: _model.maxPrice,
                                    onSubmit: (minPrice, maxPrice) async {
                                      _model.minPrice = minPrice;
                                      _model.maxPrice = maxPrice;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                      safeSetState(() => _model
                                          .staggeredViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForStaggeredView();
                                    },
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Khoảng giá',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CbFilterSearchRoomsWidget(
                                          utilities: _model.utilities,
                                          furnishings: _model.furnishings,
                                          sort: _model.sort,
                                          typeRoom: _model.roomTypes,
                                          minPrice: _model.minPrice,
                                          maxPrice: _model.maxPrice,
                                          onSubmit: (minPrice,
                                              maxPrice,
                                              typeRoom,
                                              sort,
                                              utilities,
                                              furnishings) async {
                                            _model.sort = sort;
                                            _model.minPrice = minPrice;
                                            _model.maxPrice = maxPrice;
                                            _model.roomTypes = typeRoom!
                                                .toList()
                                                .cast<RoomTypesRow>();
                                            _model.utilities = utilities!
                                                .toList()
                                                .cast<UtilitiesRow>();
                                            _model.furnishings = furnishings!
                                                .toList()
                                                .cast<FurnishingsRow>();
                                            safeSetState(() {});
                                            Navigator.pop(context);
                                            safeSetState(() => _model
                                                .staggeredViewPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForStaggeredView();
                                          },
                                          onCancel: () async {
                                            _model.sort = Sort.newest;
                                            _model.minPrice = null;
                                            _model.maxPrice = null;
                                            _model.roomTypes = [];
                                            _model.utilities = [];
                                            _model.furnishings = [];
                                            _model.city = _model.city;
                                            safeSetState(() {});
                                            Navigator.pop(context);
                                            safeSetState(() => _model
                                                .staggeredViewPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForStaggeredView();
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.filter_alt,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Lọc',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 30.0,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<List<RoomTypesRow>>(
                    future: FFAppState().roomTypes(
                      requestFn: () => RoomTypesTable().queryRows(
                        queryFn: (q) => q.order('id'),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Container(
                          width: double.infinity,
                          height: 1.0,
                          child: EmptyWidget(),
                        );
                      }
                      List<RoomTypesRow> listViewRTRoomTypesRowList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          12.0,
                          0,
                          12.0,
                          0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewRTRoomTypesRowList.length,
                        separatorBuilder: (_, __) => SizedBox(width: 16.0),
                        itemBuilder: (context, listViewRTIndex) {
                          final listViewRTRoomTypesRow =
                              listViewRTRoomTypesRowList[listViewRTIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.roomTypes
                                  .where(
                                      (e) => e.id == listViewRTRoomTypesRow.id)
                                  .toList()
                                  .isNotEmpty) {
                                _model.removeFromRoomTypes(
                                    listViewRTRoomTypesRow);
                                safeSetState(() {});
                              } else {
                                _model.addToRoomTypes(listViewRTRoomTypesRow);
                                safeSetState(() {});
                              }

                              safeSetState(() => _model
                                  .staggeredViewPagingController
                                  ?.refresh());
                              await _model.waitForOnePageForStaggeredView();
                            },
                            child: Container(
                              height: 35.0,
                              constraints: BoxConstraints(
                                minWidth: 60.0,
                              ),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.roomTypes
                                          .where((e) =>
                                              e.id == listViewRTRoomTypesRow.id)
                                          .toList()
                                          .isNotEmpty
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                child: Text(
                                  listViewRTRoomTypesRow.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.roomTypes
                                                .where((e) =>
                                                    e.id ==
                                                    listViewRTRoomTypesRow.id)
                                                .toList()
                                                .isNotEmpty
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: CdSelectCityWidget(
                              city: _model.city,
                              onSelectCity: (city) async {
                                _model.city = city;
                                safeSetState(() {});
                              },
                            ),
                          ),
                        );
                      },
                    );

                    safeSetState(
                        () => _model.staggeredViewPagingController?.refresh());
                    await _model.waitForOnePageForStaggeredView();
                  },
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 40.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.map,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Text(
                              'Khu vực: ${valueOrDefault<String>(
                                _model.city?.fullName,
                                'Tất cả',
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 30.0,
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          safeSetState(() =>
                              _model.staggeredViewPagingController?.refresh());
                          await _model.waitForOnePageForStaggeredView();
                        },
                        child: PagedMasonryGridView<ApiPagingParams,
                            dynamic>.count(
                          pagingController: _model.setStaggeredViewController(
                            (nextPageMarker) =>
                                ThuePhongGroup.getFilteredPostsCall.call(
                              minPrice: _model.minPrice,
                              maxPrice: _model.maxPrice,
                              sort: _model.sort?.name,
                              roomTypeFilterList:
                                  _model.roomTypes.map((e) => e.id).toList(),
                              utilitiesFilterList:
                                  _model.utilities.map((e) => e.id).toList(),
                              furnishingsFilterList:
                                  _model.furnishings.map((e) => e.id).toList(),
                              page: nextPageMarker.nextPageNumber,
                              token: currentJwtToken,
                              titleFilter: _model.tfSeachTextController.text,
                              cityIdFilter: _model.city?.code,
                            ),
                          ),
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          shrinkWrap: true,
                          padding: EdgeInsets.fromLTRB(
                            0,
                            12.0,
                            0,
                            30.0,
                          ),
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
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
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
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
                            noItemsFoundIndicatorBuilder: (_) => Center(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: EmptyTextWidget(
                                  text: 'Không có dữ liệu',
                                ),
                              ),
                            ),
                            itemBuilder: (context, _, itemsIndex) {
                              final itemsItem = _model
                                  .staggeredViewPagingController!
                                  .itemList![itemsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.qrPost =
                                      await PostRoomViewTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'post_id',
                                      itemsItem.postId,
                                    ),
                                  );
                                  if (_model.qrPost != null &&
                                      (_model.qrPost)!.isNotEmpty) {
                                    context.pushNamed(
                                      RoomDetailsPageWidget.routeName,
                                      queryParameters: {
                                        'post': serializeParam(
                                          _model.qrPost?.firstOrNull,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.cItemRoomModels.getModel(
                                    itemsItem.postId,
                                    itemsIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CItemRoomWidget(
                                    key: Key(
                                      'Key7ae_${itemsItem.postId}',
                                    ),
                                    room: itemsItem,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    if (false)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Bản đồ',
                            icon: Icon(
                              Icons.map,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 8.0, 30.0, 8.0),
                              iconAlignment: IconAlignment.start,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
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
  }
}
