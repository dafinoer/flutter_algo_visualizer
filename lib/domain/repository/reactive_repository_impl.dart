import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveRepositoryImpl implements ReactiveRepository<Visualizer> {
  late PublishSubject<Visualizer> _publishSubject;
  int _thresHoldTime = 400;

  ReactiveRepositoryImpl(this._thresHoldTime);

  factory ReactiveRepositoryImpl.create({int? time}) =>
      ReactiveRepositoryImpl(time ?? 400)..onSetNewControllerWhenDispose();

  @override
  void onSetNewControllerWhenDispose() {
    _publishSubject = PublishSubject<Visualizer>(
      onCancel: () => dispose(),
    );
  }

  @override
  Stream<Visualizer> watch() =>
      _publishSubject.stream.interval(Duration(milliseconds: _thresHoldTime));

  @override
  void onSetEvent(Visualizer event) {
    _publishSubject.add(event);
  }

  @override
  void onSetThresholdTime(int durationTime) {
    _thresHoldTime = durationTime;
  }

  @override
  void dispose() {
    _publishSubject.close();
  }
}
