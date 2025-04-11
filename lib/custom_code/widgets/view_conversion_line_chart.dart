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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:fl_chart/fl_chart.dart';

class ViewConversionLineChart extends StatefulWidget {
  const ViewConversionLineChart({
    super.key,
    this.width,
    this.height,
    required this.dates,
    required this.viewCounts,
    required this.conversionRates,
  });

  final double? width;
  final double? height;
  final List<String> dates;
  final List<int> viewCounts;
  final List<double> conversionRates;

  @override
  State<ViewConversionLineChart> createState() =>
      _ViewConversionLineChartState();
}

class _ViewConversionLineChartState extends State<ViewConversionLineChart> {
  List<FlSpot> _generateSpots(List<double> data) {
    return List.generate(data.length, (i) {
      double y = data[i].isNaN || data[i].isInfinite ? 0 : data[i];
      return FlSpot(i.toDouble(), y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Biểu đồ
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 300,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < widget.dates.length) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(widget.dates[index],
                              style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    reservedSize: 30,
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: _generateSpots(
                      widget.viewCounts.map((e) => e.toDouble()).toList()),
                  isCurved: true,
                  color: Colors.blue,
                  belowBarData: BarAreaData(show: false),
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: _generateSpots(widget.conversionRates),
                  isCurved: true,
                  color: Colors.orange,
                  belowBarData: BarAreaData(show: false),
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),

        // Chú thích (Legend)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(Colors.blue, "Lượt xem"),
              const SizedBox(width: 20),
              _buildLegendItem(Colors.orange, "Tỷ lệ chuyển đổi"),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

// Widget tạo chú thích
  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
