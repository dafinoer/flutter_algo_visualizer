import 'package:mobx/mobx.dart';
import 'dart:async';

import '../../components/injector.dart';
import '../../data/repository/reactive_repository.dart';
import '../../domain/entity/visualizer.dart';
import '../../domain/repository/reactive_repository_impl.dart';
import '../../domain/usecase/brute_force_usecase.dart';
import '../../domain/usecase/bubble_sort_usecase.dart';
import '../../domain/usecase/divide_and_conquer_usecase.dart';
import '../../domain/usecase/get_list_data_visualizer_usecase.dart';
import '../../domain/usecase/insert_sort_usecase.dart';
import '../../domain/usecase/merge_sort_usecase.dart';
import '../../domain/usecase/selection_sort_usecase.dart';
import 'sorting_form.dart';

part 'sorting_store.g.dart';

class SortingStore extends _SortingStore with _$SortingStore {
  SortingStore(
      super.getListDataVisualizer,
      super.reactiveRepository,
      super.bubbleSortUseCase,
      super.selectionSortUseCase,
      super.insertionSortUseCase,
      super.mergeSortUseCase);

  factory SortingStore.create() => SortingStore(
        container.resolve<GetListDataVisualizerUseCase>(),
        container.resolve<ReactiveRepositoryImpl>(),
        container.resolve<BubbleSortUseCase>(),
        container.resolve<SelectionSortUsecase>(),
        container.resolve<InsertSortUsecase>(),
        container.resolve<MergeSortUseCase>(),
      );
}

abstract class _SortingStore with Store {
  final GetListDataVisualizerUseCase getListDataVisualizer;
  final ReactiveRepository<Visualizer> reactiveRepository;
  final BruteForceUseCase bubbleSortUseCase;
  final BruteForceUseCase selectionSortUseCase;
  final BruteForceUseCase insertionSortUseCase;
  final DivideAndConquerUseCase mergeSortUseCase;

  StreamSubscription<Visualizer>? _streamSubscription;
  Set<double>? _indexColorValue;

  _SortingStore(
    this.getListDataVisualizer,
    this.reactiveRepository,
    this.bubbleSortUseCase,
    this.selectionSortUseCase,
    this.insertionSortUseCase,
    this.mergeSortUseCase,
  ) {
    _onListen();
  }

  void _onListen() {
    _streamSubscription = reactiveRepository.watch().listen((event) {
      _indexColorValue = event.indexActiveColor;
      _visualData = List.of(event.items.map((e) => e.toDouble()).toList());
      _isRunning = _indexColorValue != null;
    });
  }

  @observable
  List<double> _visualData = ObservableList();

  @computed
  List<double> get listVisualizer => _visualData;

  @observable
  bool _isRunning = false;

  @computed
  bool get isRunning => _isRunning;

  Set<double>? get indexActiveColor => _indexColorValue;

  @action
  void setDataItems(int maxItem) {
    final result = getListDataVisualizer.getVisualizer(maxItem);
    _visualData = result.items.map((e) => e.toDouble()).toList();
  }

  void onInitData() {
    setDataItems(10);
  }

  void onProcessAlgorithm(SortingType type) {
    final toListInt = _visualData.map((e) => e.toInt()).toList(growable: false);
    if (type == SortingType.bubble) {
      _isRunning = true;
      bubbleSortUseCase.sorting(toListInt);
    } else if (type == SortingType.selection) {
      _isRunning = true;
      selectionSortUseCase.sorting(toListInt);
    } else if (type == SortingType.insert) {
      _isRunning = true;
      insertionSortUseCase.sorting(toListInt);
    } else if (type == SortingType.merge) {
      _isRunning = true;
      mergeSortUseCase.setDefaultItems(toListInt);
      mergeSortUseCase.sorting(toListInt);
    }
  }

  void onSetThresHoleTime(int time) {
    reactiveRepository.onSetThresholdTime(time);
  }

  void onClose() {
    _streamSubscription?.cancel();
    reactiveRepository.dispose();
  }
}
