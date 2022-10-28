import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

typedef ChartColorByValue = Color Function(Color defaultColor, double? value,
    [double? min])?;

class ChartWidget extends StatelessWidget {
  const ChartWidget(
      {super.key,
      this.isShowLine = false,
      required this.values,
      this.chartColorByValue});

  final bool isShowLine;
  final List<double> values;
  final ChartColorByValue? chartColorByValue;

  @override
  Widget build(BuildContext context) {
    return Chart(
      height: 50.h,
      width: 50.w,
      state: ChartState.bar(
        ChartData.fromList(values.map((e) => BarValue<void>(e)).toList()),
        backgroundDecorations: [VerticalAxisDecoration(showLines: isShowLine)],
        itemOptions: BarItemOptions(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          colorForValue: chartColorByValue,
          radius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
      ),
    );
  }
}
