import '/flutter_flow/flutter_flow_util.dart';
import '/tenant/components/navigation_bar_tenant/navigation_bar_tenant_widget.dart';
import '/index.dart';
import 'profile_tenant_widget.dart' show ProfileTenantWidget;
import 'package:flutter/material.dart';

class ProfileTenantModel extends FlutterFlowModel<ProfileTenantWidget> {
  ///  State fields for stateful widgets in this page.

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
