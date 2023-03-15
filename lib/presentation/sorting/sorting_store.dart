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
      )
        ..onListenStream()
        ..setDataItems(10);
}

abstract class _SortingStore with Store {
  final GetListDataVisualizerUseCase getListDataVisualizer;
  final ReactiveRepository<Visualizer> reactiveRepository;
  final BruteForceUseCase bubbleSortUseCase;
  final BruteForceUseCase selectionSortUseCase;
  final BruteForceUseCase insertionSortUseCase;
  final DivideAndConquerUseCase mergeSortUseCase;
  bool _isDoneSorting = false;
  StreamSubscription<Visualizer>? _streamSubscription;

  _SortingStore(
    this.getListDataVisualizer,
    this.reactiveRepository,
    this.bubbleSortUseCase,
    this.selectionSortUseCase,
    this.insertionSortUseCase,
    this.mergeSortUseCase,
  );

  void onListenStream() {
    if (reactiveRepository.isClose) {
      reactiveRepository.onSetNewControllerWhenDispose();
    }
    _streamSubscription = reactiveRepository.watch().listen((event) {
      _indexColorValue = event.indexActiveColor;
      _visualData = ObservableList.of(event.items.map((e) => e.toDouble()));
      _isDoneSorting = _indexColorValue == null;
    });
  }

  @observable
  Set<double>? _indexColorValue;

  @observable
  List<double> _visualData = ObservableList<double>();

  @computed
  List<double> get listVisualizer => _visualData;

  @computed
  bool get isProcessSorting =>
      _visualData.isNotEmpty && _indexColorValue != null;

  @computed
  Set<double>? get indexActiveColor => _indexColorValue;

  bool get isDoneSorting => _isDoneSorting;

  @action
  void setDataItems(int maxItem) {
    final result = getListDataVisualizer.getVisualizer(maxItem);
    _visualData = ObservableList.of(result.items.map((e) => e.toDouble()));
  }

  void executeAlgorithm(SortingType type) async {
    _isDoneSorting = false;
    final toListInt = _visualData.map((e) => e.toInt()).toList(growable: false);
    if (type == SortingType.bubble) {
      bubbleSortUseCase.sorting(toListInt);
    } else if (type == SortingType.selection) {
      selectionSortUseCase.sorting(toListInt);
    } else if (type == SortingType.insert) {
      insertionSortUseCase.sorting(toListInt);
    } else if (type == SortingType.merge) {
      mergeSortUseCase.setDefaultItems(toListInt);
      mergeSortUseCase.sorting(toListInt);
    }
  }

  void onResetStore(int maxItem) {
    _indexColorValue = null;
    setDataItems(maxItem);
  }

  void setThresholdTime(int time) {
    reactiveRepository.onSetThresholdTime(time);
  }

  Future<void>? onCloseStream() => _streamSubscription?.cancel();
}
