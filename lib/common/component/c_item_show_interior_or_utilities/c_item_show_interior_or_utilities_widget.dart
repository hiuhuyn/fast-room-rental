import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'c_item_show_interior_or_utilities_model.dart';
export 'c_item_show_interior_or_utilities_model.dart';

/// layout interiors, utilities
class CItemShowInteriorOrUtilitiesWidget extends StatefulWidget {
  const CItemShowInteriorOrUtilitiesWidget({
    super.key,
    required this.items,
  });

  final List<dynamic>? items;

  @override
  State<CItemShowInteriorOrUtilitiesWidget> createState() =>
      _CItemShowInteriorOrUtilitiesWidgetState();
}

class _CItemShowInteriorOrUtilitiesWidgetState
    extends State<CItemShowInteriorOrUtilitiesWidget> {
  late CItemShowInteriorOrUtilitiesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CItemShowInteriorOrUtilitiesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final items = widget.items!.toList();

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(items.length, (itemsIndex) {
            final itemsItem = items[itemsIndex];
            return Container(
              width: 86.0,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      '${getJsonField(
                        itemsItem,
                        r'''$.url''',
                      ).toString()}',
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      getJsonField(
                        itemsItem,
                        r'''$.title''',
                      ).toString().maybeHandleOverflow(
                            maxChars: 25,
                          ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }).divide(SizedBox(width: 8.0)),
        );
      },
    );
  }
}
