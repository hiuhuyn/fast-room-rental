import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'item_media_local_file_model.dart';
export 'item_media_local_file_model.dart';

class ItemMediaLocalFileWidget extends StatefulWidget {
  const ItemMediaLocalFileWidget({
    super.key,
    this.file,
    this.onTap,
    int? radius,
    double? width,
    double? hight,
    this.onDelete,
    bool? isShowDeleted,
  })  : this.radius = radius ?? 0,
        this.width = width ?? 100.0,
        this.hight = hight ?? 100.0,
        this.isShowDeleted = isShowDeleted ?? false;

  final FFUploadedFile? file;
  final Future Function(FFUploadedFile file, MediaType type)? onTap;
  final int radius;
  final double width;
  final double hight;
  final Future Function()? onDelete;
  final bool isShowDeleted;

  @override
  State<ItemMediaLocalFileWidget> createState() =>
      _ItemMediaLocalFileWidgetState();
}

class _ItemMediaLocalFileWidgetState extends State<ItemMediaLocalFileWidget> {
  late ItemMediaLocalFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemMediaLocalFileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.type = functions.checkTypeMediaFile(widget.file);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call(
          widget.file!,
          _model.type!,
        );
      },
      child: Container(
        width: widget.width,
        height: widget.hight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget.radius.toDouble(),
            0.0,
          )),
        ),
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                if (_model.type == null) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/uecuhb.jpg',
                        ).image,
                      ),
                      borderRadius:
                          BorderRadius.circular(valueOrDefault<double>(
                        widget.radius.toDouble(),
                        0.0,
                      )),
                    ),
                  );
                } else if (_model.type == MediaType.image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      widget.radius.toDouble(),
                      0.0,
                    )),
                    child: Image.memory(
                      widget.file?.bytes ?? Uint8List.fromList([]),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Video',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            letterSpacing: 0.0,
                          ),
                    ),
                  );
                }
              },
            ),
            if (widget.isShowDeleted)
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 50.0,
                    buttonSize: 40.0,
                    fillColor: Color(0x81F0F0F0),
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.onDelete?.call();
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
