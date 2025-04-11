import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'room_details_page_widget.dart' show RoomDetailsPageWidget;
import 'package:flutter/material.dart';

class RoomDetailsPageModel extends FlutterFlowModel<RoomDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in RoomDetailsPage widget.
  List<PostViewerRow>? checkView;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  Completer<List<FavoritesRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatOverviewRow>? qrChatViewCheck;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatOverviewRow>? qrChatViewCheck2;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChatsRow? insertChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
