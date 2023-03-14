import 'package:algovisualizer/presentation/sorting/sorting_store.dart';
import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

typedef ChartColorByValue = Color Function(Color defaultColor, double? value,
    [double? min])?;

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Chart(
        height: 50.h,
        width: 50.w,
        state: ChartState.bar(
          ChartData.fromList(
            context
                .read<SortingStore>()
                .listVisualizer
                .map((e) => BarValue<void>(e))
                .toList(growable: false),
          ),
          backgroundDecorations: [VerticalAxisDecoration(showLines: false)],
          itemOptions: BarItemOptions(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            colorForValue: (defaultColor, value, [min]) {
              final valueColor = context.read<SortingStore>().indexActiveColor;
              if (valueColor != null && valueColor.contains(value)) {
                return Colors.yellow;
              }
              return Colors.blueAccent;
            },
            radius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
