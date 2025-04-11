import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/navigation_bar_tenant/navigation_bar_tenant_widget.dart';
import '/index.dart';
import 'home_tenant_widget.dart' show HomeTenantWidget;
import 'package:flutter/material.dart';

class HomeTenantModel extends FlutterFlowModel<HomeTenantWidget> {
  ///  Local state fields for this page.

  List<dynamic> locationHighlight = [];
  void addToLocationHighlight(dynamic item) => locationHighlight.add(item);
  void removeFromLocationHighlight(dynamic item) =>
      locationHighlight.remove(item);
  void removeAtIndexFromLocationHighlight(int index) =>
      locationHighlight.removeAt(index);
  void insertAtIndexInLocationHighlight(int index, dynamic item) =>
      locationHighlight.insert(index, item);
  void updateLocationHighlightAtIndex(int index, Function(dynamic) updateFn) =>
      locationHighlight[index] = updateFn(locationHighlight[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for navigationBarTenant component.
  late NavigationBarTenantModel navigationBarTenantModel;

  @override
  void initState(BuildContext context) {
    navigationBarTenantModel =
        createModel(context, () => NavigationBarTenantModel());
  }

  @override
  void dispose() {
    navigationBarTenantModel.dispose();
  }
}
