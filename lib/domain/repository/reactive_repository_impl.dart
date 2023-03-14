import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveRepositoryImpl implements ReactiveRepository<Visualizer> {
  PublishSubject<Visualizer> _publishSubject;
  int _thresHoldTime = 400;

  ReactiveRepositoryImpl(this._publishSubject, this._thresHoldTime);

  factory ReactiveRepositoryImpl.create({int? time}) =>
      ReactiveRepositoryImpl(PublishSubject<Visualizer>(), time ?? 400)
        ..onSetNewControllerWhenDispose();

  @override
  void onSetNewControllerWhenDispose() {
    final isClose = _publishSubject.isClosed;
    if (isClose) {
      _publishSubject = PublishSubject<Visualizer>(
        onCancel: () => dispose(),
      );
    }
  }

  @override
  Stream<Visualizer> watch() => _publishSubject.stream
      .delay(Duration(milliseconds: _thresHoldTime))
      .asyncMap((event) => event);

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
