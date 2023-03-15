import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../presentation/sorting/sorting_form.dart';
import '../../presentation/sorting/sorting_store.dart';
import '../../widgets/chart_widget.dart';
import 'components/algoritm_button.dart';
import 'components/dropdown_speed_button.dart';
import 'components/dropdown_total_data_widget.dart';
import 'components/go_button.dart';
import 'components/reset_button.dart';

class SortingPage extends StatefulWidget {
  const SortingPage({super.key});

  @override
  State<SortingPage> createState() => _SortingPageState();
}

class _SortingPageState extends State<SortingPage> {
  late final SortingStore _sortingStore;
  late final SortingForm _sortingForm;
  late final ReactionDisposer reactionTotalItem;
  late final ReactionDisposer reactionThresholdTime;
  late final ReactionDisposer reactionSortingType;
  late final ReactionDisposer reactionRunningSorting;

  @override
  void initState() {
    super.initState();
    _sortingStore = SortingStore.create();
    _sortingForm = SortingForm();
    onReactionRunning();
    onReactionItems();
    onReactionThresholdTime();
    onReactionChangeSorting();
  }

  void onReactionRunning() {
    reactionRunningSorting =
        reaction((_) => _sortingStore.isProcessSorting, (isSorting) {
      if (isSorting) {
        _sortingForm.run();
      } else {
        _sortingForm.stop();
      }
    });
  }

  void onReactionItems() {
    reactionTotalItem = reaction((_) => _sortingForm.totalItem, (value) {
      if (value != null) _sortingStore.setDataItems(value);
    });
  }

  void onReactionThresholdTime() {
    reactionThresholdTime = reaction((_) => _sortingForm.thresholdTime, (time) {
      if (time != null) _sortingStore.setThresholdTime(time);
    });
  }

  void onReactionChangeSorting() {
    reactionSortingType = reaction(
      (_) => _sortingForm.sortingType,
      (sortingType) {
        if (sortingType != null) {
          _sortingStore.onCloseStream()?.then(
            (_) {
              _sortingStore.onListenStream();
              final totalItem = _sortingForm.totalItem;
              if (totalItem != null) _sortingStore.onResetStore(totalItem);
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    reactionTotalItem.call();
    reactionThresholdTime.call();
    reactionSortingType.call();
    reactionRunningSorting.call();
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
