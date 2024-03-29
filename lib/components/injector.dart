import 'package:algovisualizer/domain/repository/reactive_repository_impl.dart';
import 'package:algovisualizer/domain/usecase/bubble_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/get_list_data_visualizer_usecase.dart';
import 'package:algovisualizer/domain/usecase/insert_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/merge_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/selection_sort_usecase.dart';
import 'package:kiwi/kiwi.dart';

import '../data/data_source/local_data_source.dart';
import '../domain/repository/visualizer_repository_impl.dart';

final container = KiwiContainer();

void onRegisterInjector() {
  //data
  container.registerInstance<LocalDataSource>(const LocalDataSource());

  //repository_impl
  container.registerInstance<VisualizerRepositoryImpl>(
      VisualizerRepositoryImpl(container.resolve<LocalDataSource>()));
  container.registerInstance<ReactiveRepositoryImpl>(
      ReactiveRepositoryImpl.create());

  // domain = usecase
  container.registerInstance(GetListDataVisualizerUseCase(
      container.resolve<VisualizerRepositoryImpl>()));
  container.registerInstance<BubbleSortUseCase>(
      BubbleSortUseCase(container.resolve<ReactiveRepositoryImpl>()));
  container.registerInstance<SelectionSortUsecase>(
      SelectionSortUsecase(container.resolve<ReactiveRepositoryImpl>()));
  container.registerInstance<InsertSortUsecase>(
    InsertSortUsecase(container.resolve<ReactiveRepositoryImpl>()),
  );
  container.registerInstance<MergeSortUseCase>(
      MergeSortUseCase(container.resolve<ReactiveRepositoryImpl>()));
}
