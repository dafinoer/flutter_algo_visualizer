import 'package:algovisualizer/components/injector.dart';
import 'package:algovisualizer/domain/repository/reactive_repository_impl.dart';
import 'package:algovisualizer/domain/usecase/bubble_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/get_list_data_visualizer_usecase.dart';
import 'package:algovisualizer/domain/usecase/selection_sort_usecase.dart';
import 'package:algovisualizer/pages/sorting/components/go_button.dart';
import 'package:algovisualizer/pages/sorting/components/reset_button.dart';
import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../presentation/sorting/sorting_store.dart';
import '../../widgets/chart_widget.dart';
import 'components/algoritm_button.dart';
import 'components/dropdown_speed_button.dart';
import 'components/dropdown_total_data_widget.dart';

class SortingPage extends StatefulWidget {
  const SortingPage({super.key});

  @override
  State<SortingPage> createState() => _SortingPageState();
}

class _SortingPageState extends State<SortingPage> {
  late final SortingStore _sortingStore;
  late final SortingForm _sortingForm;

  @override
  void initState() {
    super.initState();
    final getList = container.resolve<GetListDataVisualizerUseCase>();
    _sortingStore = SortingStore(
        getList,
        container.resolve<ReactiveRepositoryImpl>(),
        container.resolve<BubbleSortUseCase>(),
        container.resolve<SelectionSortUsecase>());
    _sortingForm = SortingForm();
    _sortingStore.onInitData();
    reaction((_) => _sortingForm.totalItem,
        (_) => _sortingStore.setDataItems(_sortingForm.totalItem));
    reaction((_) => _sortingStore.isRunning,
        (value) => _sortingForm.onDisableButton(value));
    reaction((p0) => _sortingForm.thresHoleTime,
        (time) => _sortingStore.onSetThresHoleTime(time));
  }

  @override
  void dispose() {
    _sortingStore.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _sortingForm),
        Provider.value(value: _sortingStore)
      ],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    AlgoritmButton(),
                    DropdownSpeedButton(),
                    DropdownTotalDataWidget(),
                    GoButton(),
                    ResetButton()
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Observer(
              builder: (context) {
                return ChartWidget(
                  values: _sortingStore.listVisualizer,
                  chartColorByValue: (defaultColor, value, [min]) {
                    final valueColor = _sortingStore.indexActiveColor;
                    if (valueColor != null && valueColor.contains(value)) {
                      return Colors.yellow;
                    }
                    return Colors.blueAccent;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
