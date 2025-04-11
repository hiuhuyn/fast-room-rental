import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'item_sort_model.dart';
export 'item_sort_model.dart';

class ItemSortWidget extends StatefulWidget {
  const ItemSortWidget({
    super.key,
    required this.init,
    this.onChange,
  });

  final Sort? init;
  final Future Function(Sort value)? onChange;

  @override
  State<ItemSortWidget> createState() => _ItemSortWidgetState();
}

class _ItemSortWidgetState extends State<ItemSortWidget> {
  late ItemSortModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemSortModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ctSort = widget.init;
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.ctSort = Sort.newest;
            safeSetState(() {});
            await widget.onChange?.call(
              Sort.newest,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.timer_sharp,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 24.0,
              ),
              Expanded(
                child: Text(
                  'Tin mới',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: (_model.ctSort == Sort.newest) ||
                            (_model.ctSort == null)
                        ? FlutterFlowTheme.of(context).tertiary
                        : FlutterFlowTheme.of(context).primaryText,
                    width: 3.0,
                  ),
                ),
                child: Visibility(
                  visible: _model.ctSort == Sort.newest,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: (_model.ctSort == Sort.newest) ||
                                (_model.ctSort == null)
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).primaryText,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.ctSort = Sort.price_desc;
            safeSetState(() {});
            await widget.onChange?.call(
              Sort.price_desc,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.monetization_on_outlined,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 24.0,
              ),
              Expanded(
                child: Text(
                  'Giá từ cao tới thấp',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _model.ctSort == Sort.price_desc
                        ? FlutterFlowTheme.of(context).tertiary
                        : FlutterFlowTheme.of(context).primaryText,
                    width: 3.0,
                  ),
                ),
                child: Visibility(
                  visible: _model.ctSort == Sort.price_desc,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: _model.ctSort == Sort.price_desc
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).primaryText,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.ctSort = Sort.price_asc;
            safeSetState(() {});
            await widget.onChange?.call(
              Sort.price_asc,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.monetization_on_outlined,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 24.0,
              ),
              Expanded(
                child: Text(
                  'Giá từ thấp tới cao',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _model.ctSort == Sort.price_asc
                        ? FlutterFlowTheme.of(context).tertiary
                        : FlutterFlowTheme.of(context).primaryText,
                    width: 3.0,
                  ),
                ),
                child: Visibility(
                  visible: _model.ctSort == Sort.price_asc,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: _model.ctSort == Sort.price_asc
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).primaryText,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
