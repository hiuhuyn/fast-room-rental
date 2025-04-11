import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cd_booking_room_widget.dart' show CdBookingRoomWidget;
import 'package:flutter/material.dart';

class CdBookingRoomModel extends FlutterFlowModel<CdBookingRoomWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for tfNote widget.
  FocusNode? tfNoteFocusNode;
  TextEditingController? tfNoteTextController;
  String? Function(BuildContext, String?)? tfNoteTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? insertBooking;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfNoteFocusNode?.dispose();
    tfNoteTextController?.dispose();
  }
}
