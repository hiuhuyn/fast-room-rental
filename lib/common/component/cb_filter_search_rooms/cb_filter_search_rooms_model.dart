import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/common/component/item_sort/item_sort_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cb_filter_search_rooms_widget.dart' show CbFilterSearchRoomsWidget;
import 'package:flutter/material.dart';

class CbFilterSearchRoomsModel
    extends FlutterFlowModel<CbFilterSearchRoomsWidget> {
  ///  Local state fields for this component.

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

  List<RoomTypesRow> typeRoom = [];
  void addToTypeRoom(RoomTypesRow item) => typeRoom.add(item);
  void removeFromTypeRoom(RoomTypesRow item) => typeRoom.remove(item);
  void removeAtIndexFromTypeRoom(int index) => typeRoom.removeAt(index);
  void insertAtIndexInTypeRoom(int index, RoomTypesRow item) =>
      typeRoom.insert(index, item);
  void updateTypeRoomAtIndex(int index, Function(RoomTypesRow) updateFn) =>
      typeRoom[index] = updateFn(typeRoom[index]);

  Sort? ctSort = Sort.newest;

  ///  State fields for stateful widgets in this component.

  // State field(s) for tfMin widget.
  FocusNode? tfMinFocusNode;
  TextEditingController? tfMinTextController;
  String? Function(BuildContext, String?)? tfMinTextControllerValidator;
  // State field(s) for tfMax widget.
  FocusNode? tfMaxFocusNode;
  TextEditingController? tfMaxTextController;
  String? Function(BuildContext, String?)? tfMaxTextControllerValidator;
  // Model for itemSort component.
  late ItemSortModel itemSortModel;

  @override
  void initState(BuildContext context) {
    itemSortModel = createModel(context, () => ItemSortModel());
  }

  @override
  void dispose() {
    tfMinFocusNode?.dispose();
    tfMinTextController?.dispose();

    tfMaxFocusNode?.dispose();
    tfMaxTextController?.dispose();

    itemSortModel.dispose();
  }
}
