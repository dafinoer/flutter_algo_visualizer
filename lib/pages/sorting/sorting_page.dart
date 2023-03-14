import 'package:algovisualizer/pages/sorting/components/go_button.dart';
import 'package:algovisualizer/pages/sorting/components/reset_button.dart';
import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
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
  late final ReactionDisposer reactionTotalItem;
  late final ReactionDisposer reactionRunning;
  late final ReactionDisposer reactionThresHoleTime;

  @override
  void initState() {
    super.initState();
    _sortingStore = SortingStore.create()..onInitData();
    _sortingForm = SortingForm();
    reactionTotalItem = reaction((_) => _sortingForm.totalItem,
        (_) => _sortingStore.setDataItems(_sortingForm.totalItem));
    reactionRunning = reaction((_) => _sortingStore.isRunning,
        (value) => _sortingForm.onDisableButton(value));
    reactionThresHoleTime = reaction((p0) => _sortingForm.thresHoleTime,
        (time) => _sortingStore.onSetThresHoleTime(time));
  }

  @override
  void dispose() {
    _sortingStore.onClose();
    reactionTotalItem.call();
    reactionRunning.call();
    reactionThresHoleTime.call();
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
            padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
            child: SizedBox(
              width: 100.w,
              child: Row(
                children: const [
                  Expanded(child: AlgoritmButton()),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownSpeedButton()),
                  ),
                  Expanded(child: DropdownTotalDataWidget()),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: GoButton()),
                  ResetButton()
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: ChartWidget(),
          ),
        ],
      ),
    );
  }
}
