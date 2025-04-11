import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'item_media_url_model.dart';
export 'item_media_url_model.dart';

class ItemMediaUrlWidget extends StatefulWidget {
  const ItemMediaUrlWidget({
    super.key,
    this.url,
    this.onTap,
    int? radius,
    this.width,
    this.hight,
  }) : this.radius = radius ?? 0;

  final String? url;
  final Future Function(String url, MediaType type)? onTap;
  final int radius;
  final double? width;
  final double? hight;

  @override
  State<ItemMediaUrlWidget> createState() => _ItemMediaUrlWidgetState();
}

class _ItemMediaUrlWidgetState extends State<ItemMediaUrlWidget> {
  late ItemMediaUrlModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemMediaUrlModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.type = functions.checkUrlMediaType(widget.url);
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
      onTap: () async {},
      child: Container(
        width: widget.width,
        height: widget.hight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget.radius.toDouble(),
            0.0,
          )),
        ),
        child: Builder(
          builder: (context) {
            if (_model.type == MediaType.image) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(valueOrDefault<double>(
                  widget.radius.toDouble(),
                  0.0,
                )),
                child: Image.network(
                  '${widget.url}',
                  width: widget.width,
                  height: widget.hight,
                  fit: BoxFit.cover,
                ),
              );
            } else if (_model.type == MediaType.video) {
              return Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowVideoPlayer(
                  path: '${widget.url}',
                  videoType: VideoType.network,
                  width: widget.width,
                  autoPlay: false,
                  looping: true,
                  showControls: true,
                  allowFullScreen: true,
                  allowPlaybackSpeedMenu: true,
                  lazyLoad: true,
                ),
              );
            } else {
              return Container(
                width: widget.width,
                height: widget.hight,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget.radius.toDouble(),
                    0.0,
                  )),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
