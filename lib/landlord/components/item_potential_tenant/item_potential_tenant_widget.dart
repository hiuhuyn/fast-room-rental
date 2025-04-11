import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'item_potential_tenant_model.dart';
export 'item_potential_tenant_model.dart';

/// Khách hàng tiềm năng, hiển thị home của chủ phòng
class ItemPotentialTenantWidget extends StatefulWidget {
  const ItemPotentialTenantWidget({
    super.key,
    required this.user,
  });

  final PotentialUsersRow? user;

  @override
  State<ItemPotentialTenantWidget> createState() =>
      _ItemPotentialTenantWidgetState();
}

class _ItemPotentialTenantWidgetState extends State<ItemPotentialTenantWidget> {
  late ItemPotentialTenantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemPotentialTenantModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                if (widget.user?.avtFileName == null ||
                    widget.user?.avtFileName == '') {
                  return Container(
                    width: 50.0,
                    height: 50.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/900/600',
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(1000.0),
                    child: OctoImage(
                      placeholderBuilder: (_) => SizedBox.expand(
                        child: Image(
                          image: BlurHashImage(widget.user!.avtBlurHash!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      image: NetworkImage(
                        widget.user!.avtFileName!,
                      ),
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.user?.username != null &&
                      widget.user?.username != '')
                    Text(
                      widget.user!.username!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {},
              child: Icon(
                FFIcons.kmailCircled,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 34.0,
              ),
            ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
