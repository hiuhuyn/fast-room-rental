import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'item_utility_and_furniture_model.dart';
export 'item_utility_and_furniture_model.dart';

/// Dùng hiển thị những item khi hiển thị phòng
class ItemUtilityAndFurnitureWidget extends StatefulWidget {
  const ItemUtilityAndFurnitureWidget({
    super.key,
    bool? isShowDeleted,
    this.onDeleted,
    this.url,
    required this.name,
  }) : this.isShowDeleted = isShowDeleted ?? false;

  final bool isShowDeleted;
  final Future Function()? onDeleted;
  final String? url;
  final String? name;

  @override
  State<ItemUtilityAndFurnitureWidget> createState() =>
      _ItemUtilityAndFurnitureWidgetState();
}

class _ItemUtilityAndFurnitureWidgetState
    extends State<ItemUtilityAndFurnitureWidget> {
  late ItemUtilityAndFurnitureModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemUtilityAndFurnitureModel());

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
      constraints: BoxConstraints(
        minWidth: 100.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.url != null && widget.url != '')
              Container(
                width: 30.0,
                height: 30.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/821/600',
                  fit: BoxFit.cover,
                ),
              ),
            Flexible(
              child: Text(
                widget.name!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            if (widget.isShowDeleted)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.onDeleted?.call();
                },
                child: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
