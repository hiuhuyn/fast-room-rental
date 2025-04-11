import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/c_item_room/c_item_room_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'search_room_widget.dart' show SearchRoomWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchRoomModel extends FlutterFlowModel<SearchRoomWidget> {
  ///  Local state fields for this page.

  Sort? sort = Sort.newest;

  int? minPrice;

  int? maxPrice;

  List<RoomTypesRow> roomTypes = [];
  void addToRoomTypes(RoomTypesRow item) => roomTypes.add(item);
  void removeFromRoomTypes(RoomTypesRow item) => roomTypes.remove(item);
  void removeAtIndexFromRoomTypes(int index) => roomTypes.removeAt(index);
  void insertAtIndexInRoomTypes(int index, RoomTypesRow item) =>
      roomTypes.insert(index, item);
  void updateRoomTypesAtIndex(int index, Function(RoomTypesRow) updateFn) =>
      roomTypes[index] = updateFn(roomTypes[index]);

  List<UtilitiesRow> utilities = [];
  void addToUtilities(UtilitiesRow item) => utilities.add(item);
  void removeFromUtilities(UtilitiesRow item) => utilities.remove(item);
  void removeAtIndexFromUtilities(int index) => utilities.removeAt(index);
  void insertAtIndexInUtilities(int index, UtilitiesRow item) =>
      utilities.insert(index, item);
  void updateUtilitiesAtIndex(int index, Function(UtilitiesRow) updateFn) =>
      utilities[index] = updateFn(utilities[index]);

  List<FurnishingsRow> furnishings = [];
  void addToFurnishings(FurnishingsRow item) => furnishings.add(item);
  void removeFromFurnishings(FurnishingsRow item) => furnishings.remove(item);
  void removeAtIndexFromFurnishings(int index) => furnishings.removeAt(index);
  void insertAtIndexInFurnishings(int index, FurnishingsRow item) =>
      furnishings.insert(index, item);
  void updateFurnishingsAtIndex(int index, Function(FurnishingsRow) updateFn) =>
      furnishings[index] = updateFn(furnishings[index]);

  CitiesRow? city;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in SearchRoom widget.
  List<CitiesRow>? qrCity;
  // Stores action output result for [Backend Call - Query Rows] action in SearchRoom widget.
  List<RoomTypesRow>? qrRT;
  // State field(s) for tfSeach widget.
  FocusNode? tfSeachFocusNode;
  TextEditingController? tfSeachTextController;
  String? Function(BuildContext, String?)? tfSeachTextControllerValidator;
  // State field(s) for StaggeredView widget.

  PagingController<ApiPagingParams, dynamic>? staggeredViewPagingController;
  Function(ApiPagingParams nextPageMarker)? staggeredViewApiCall;

  // Models for cItemRoom dynamic component.
  late FlutterFlowDynamicModels<CItemRoomModel> cItemRoomModels;
  // Stores action output result for [Backend Call - Query Rows] action in cItemRoom widget.
  List<PostRoomViewRow>? qrPost;

  @override
  void initState(BuildContext context) {
    cItemRoomModels = FlutterFlowDynamicModels(() => CItemRoomModel());
  }

  @override
  void dispose() {
    tfSeachFocusNode?.dispose();
    tfSeachTextController?.dispose();

    staggeredViewPagingController?.dispose();
    cItemRoomModels.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForStaggeredView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (staggeredViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setStaggeredViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    staggeredViewApiCall = apiCall;
    return staggeredViewPagingController ??=
        _createStaggeredViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createStaggeredViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(staggeredViewGetFilteredPostsPage);
  }

  void staggeredViewGetFilteredPostsPage(ApiPagingParams nextPageMarker) =>
      staggeredViewApiCall!(nextPageMarker)
          .then((staggeredViewGetFilteredPostsResponse) {
        final pageItems = ((staggeredViewGetFilteredPostsResponse.jsonBody
                        .toList()
                        .map<RoomSearchStruct?>(RoomSearchStruct.maybeFromMap)
                        .toList() as Iterable<RoomSearchStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        staggeredViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: staggeredViewGetFilteredPostsResponse,
                )
              : null,
        );
      });
}
