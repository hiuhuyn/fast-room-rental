// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:fl_chart/fl_chart.dart';

class PostStatusBarChart extends StatefulWidget {
  const PostStatusBarChart({
    super.key,
    this.width,
    this.height,
    required this.activePosts,
    required this.expiredPosts,
  });

  final double? width;
  final double? height;
  final int activePosts;
  final int expiredPosts;

  @override
  State<PostStatusBarChart> createState() => _PostStatusBarChartState();
}

class _PostStatusBarChartState extends State<PostStatusBarChart> {
  @override
  Widget build(BuildContext context) {
    double activePosts = widget.activePosts.toDouble();
    double expiredPosts = widget.expiredPosts.toDouble();

    // Đảm bảo giá trị hợp lệ
    if (activePosts.isNaN || activePosts.isInfinite) activePosts = 0;
    if (expiredPosts.isNaN || expiredPosts.isInfinite) expiredPosts = 0;

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 250,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(toY: activePosts, color: Colors.green, width: 20)
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(toY: expiredPosts, color: Colors.red, width: 20)
            ]),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Còn hiệu lực",
                            style: TextStyle(fontSize: 12)),
                      );
                    case 1:
                      return const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Hết hạn", style: TextStyle(fontSize: 12)),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          borderData:
              FlBorderData(show: true, border: Border.all(color: Colors.grey)),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }
}
