import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartScreen extends StatefulWidget {
  const LineChartScreen({super.key});

  @override
  _LineChartScreenState createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = [
      ChartData('Jan', 10),
      ChartData('Feb', 20),
      ChartData('Mar', 45),
      ChartData('Apr', 30),
      ChartData('May', 75),
      ChartData('Jun', 50),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: 'Revenue',
        format: 'point.x: point.y',
        textStyle: TextStyle(color: theme.primary),
        color: theme.tertiaryContainer,
      ),
      plotAreaBorderWidth: 0,
      plotAreaBackgroundColor: Colors.transparent,
      margin: EdgeInsets.zero,
      primaryXAxis: CategoryAxis(
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(
          width: 1,
          // dashArray: <double>[5, 3],
          color: theme.tertiary,
        ),
        // minorGridLines: const MinorGridLines(width: 0),
        axisLine: AxisLine(width: 1, color: theme.tertiary),
        labelStyle: TextStyle(color: theme.onSecondary),
      ),
      primaryYAxis: CategoryAxis(
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(
          width: 1,
          // dashArray: <double>[5, 3],
          color: theme.tertiary,
        ),
        // minorGridLines: const MinorGridLines(width: 0),
        axisLine: AxisLine(width: 1, color: theme.tertiary),
        labelStyle: TextStyle(color: theme.onSecondary),
      ),
      series: <CartesianSeries<ChartData, String>>[
        SplineAreaSeries<ChartData, String>(
          // name: 'Bed Room',
          dataSource: _chartData,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.salesA,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.primary.withOpacity(0.7),
              theme.primary.withOpacity(0.2),
            ],
          ),
          borderColor: theme.primary,
          borderWidth: 2,
          markerSettings: MarkerSettings(
            isVisible: true,
            borderWidth: 0,
            color: theme.primary,
            height: 10,
            width: 10,
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String month;
  final double salesA;

  ChartData(this.month, this.salesA);
}

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          size: medium,
          fontWeight: mediumWeight,
          lineheight: linesmall,
          color: theme.secondary,
          val: 'Your Activity',
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: theme.primaryContainer,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadow.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 6,
              ),
            ],
          ),
          width: 320.w,
          child: LineChartScreen(),
        ),
      ],
    );
  }
}
